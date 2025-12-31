package com.javaweb.service.impl;

import com.javaweb.converter.CustomerConverter;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.NotificationEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.NotificationRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.ICustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class CustomerService implements ICustomerService {

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private CustomerConverter customerConverter;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private SimpMessagingTemplate messagingTemplate;

    @Autowired
    private NotificationRepository notificationRepository;

    @Override
    public ResponseDTO loadStaffs(Long id) {
        CustomerEntity customerEntity = customerRepository.findById(id).get();
        List<UserEntity> allStaffs = userRepository.findByStatusAndRoles_Code(1, "STAFF");
        List<UserEntity> assignedStaffs = customerEntity.getUserEntities();
        // optimize
        List<Long> assignedStaffIds = new ArrayList<>();
        for (UserEntity staff : assignedStaffs) {
            assignedStaffIds.add(staff.getId());
        }
        List<StaffResponseDTO> staffResponseDTOList = new ArrayList<>();
        ResponseDTO responseDTO = new ResponseDTO();
        for (UserEntity staff : allStaffs) {
            StaffResponseDTO staffResponseDTO = new StaffResponseDTO();
            staffResponseDTO.setStaffId(staff.getId());
            staffResponseDTO.setFullName(staff.getFullName());
            if (assignedStaffIds.contains(staff.getId())) {
                staffResponseDTO.setChecked("checked");
            } else {
                staffResponseDTO.setChecked("");
            }
            staffResponseDTOList.add(staffResponseDTO);
        }
        responseDTO.setData(staffResponseDTOList);
        responseDTO.setMessage("success");
        return responseDTO;
    }

    @Override
    public Page<CustomerSearchResponse> listCustomers(CustomerSearchRequest customerSearchRequest, Pageable pageable) {
        Page<CustomerEntity> customerEntities = customerRepository.getCustomerEntities(customerSearchRequest, pageable);
        Page<CustomerSearchResponse> customerSearchResponsePage = customerEntities.map(entity -> customerConverter.convertEntityToResponse(entity));

        return customerSearchResponsePage;
    }

    @Override
    @Transactional
    public void addOrUpdateCustomer(CustomerDTO customerDTO) {
        CustomerEntity customerEntity;

        if (customerDTO.getId() != null) {

            customerEntity = customerRepository.findById(customerDTO.getId())
                    .orElseThrow(() -> new RuntimeException("Customer not found"));

            customerEntity.setFullName(customerDTO.getFullName());
            customerEntity.setPhone(customerDTO.getCustomerPhone());
            customerEntity.setEmail(customerDTO.getEmail());
            customerEntity.setCompanyName(customerDTO.getCompanyName());
            customerEntity.setDemand(customerDTO.getDemand());
            customerEntity.setStatus(customerDTO.getStatus());

        } else {
            customerEntity = customerConverter.convertDTOToEntity(customerDTO);
            customerEntity.setIsActive(1);
        }

        customerRepository.save(customerEntity);
    }

    @Override
    @Transactional
    public void deleteCustomer(List<Long> ids) {
        List<CustomerEntity> customerEntities = customerRepository.findAllById(ids);
        for (CustomerEntity customerEntity : customerEntities) {
            customerEntity.setIsActive(0);
        }
    }

    @Override
    public CustomerDTO getCustomer(Long id) {
        CustomerEntity customerEntity = customerRepository.findById(id).get();
        CustomerDTO customerDTO = customerConverter.convertEntityToDTO(customerEntity);
        return customerDTO;
    }

    @Override
    @Transactional
    public void assignCustomer(AssignmentCustomerDTO assignmentCustomerDTO) {
        CustomerEntity customerEntity = customerRepository.findById(assignmentCustomerDTO.getCustomerId())
                .orElseThrow(() -> new RuntimeException("Customer not found"));
        List<UserEntity> userEntities = userRepository.findAllById(assignmentCustomerDTO.getStaffs());

        if (customerEntity.getUserEntities() == null) {
            customerEntity.setUserEntities(new ArrayList<>());
        }

        customerEntity.getUserEntities().clear();
        customerEntity.getUserEntities().addAll(userEntities);
        customerRepository.save(customerEntity);

        for (UserEntity staff: userEntities) {
            String message = "Bạn vừa được giao quản lí khách hàng: " + customerEntity.getFullName();

            String directLink = "/admin/building-edit-" + customerEntity.getId();

            NotificationEntity notification = new NotificationEntity();
            notification.setContent(message);
            notification.setUser(staff);
            notification.setStatus(0L);
            notification.setLink(directLink);
            notificationRepository.save(notification);

            messagingTemplate.convertAndSendToUser(staff.getUserName(), "/queue/notifications", message);
        }
    }


}
