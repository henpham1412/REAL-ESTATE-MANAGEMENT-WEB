package com.javaweb.service;

import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ICustomerService {
    ResponseDTO loadStaffs(Long id);
    Page<CustomerSearchResponse> listCustomers(CustomerSearchRequest customerSearchRequest, Pageable pageable);
    void addOrUpdateCustomer(CustomerDTO customerDTO);
    void deleteCustomer(List<Long> ids);
    CustomerDTO getCustomer(Long id);
    void assignCustomer(AssignmentCustomerDTO assignmentCustomerDTO);
}
