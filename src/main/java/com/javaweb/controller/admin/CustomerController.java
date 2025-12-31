package com.javaweb.controller.admin;

import com.javaweb.enums.TransactionType;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.security.utils.SecurityUtils;
import com.javaweb.service.impl.CustomerService;
import com.javaweb.service.impl.TransactionService;
import com.javaweb.service.impl.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import org.springframework.data.domain.Pageable;

import java.util.HashMap;
import java.util.Map;

@Controller(value="customerControllerOfAdmin")
public class CustomerController {

    @Autowired
    private UserService userService;

    @Autowired
    private CustomerService customerService;

    @Autowired
    private TransactionService transactionService;

    @RequestMapping(value="/admin/customer-list", method = RequestMethod.GET)
    public ModelAndView customerList(@ModelAttribute("customerSearch") CustomerSearchRequest  customerSearchRequest,
                                     HttpServletRequest request, @PageableDefault(size = 3, page = 0) Pageable pageable) {
        ModelAndView modelAndView = new ModelAndView("admin/customer/list");

        modelAndView.addObject("customerSearch",  customerSearchRequest);
        modelAndView.addObject("listStaffs", userService.getStaffs());
        if (SecurityUtils.getAuthorities().contains("ROLE_STAFF")) {
            long staffId = SecurityUtils.getPrincipal().getId();
            customerSearchRequest.setStaffId(staffId);
            modelAndView.addObject("customerPage", customerService.listCustomers(customerSearchRequest, pageable));
        } else {
            modelAndView.addObject("customerPage", customerService.listCustomers(customerSearchRequest, pageable));
        }
        return modelAndView;
    }


    @RequestMapping(value = "/admin/customer-edit", method = RequestMethod.GET)
    public ModelAndView customerEdit(@ModelAttribute CustomerDTO customerDTO, HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView("admin/customer/edit");
        Map<String, String> statusMap = new HashMap<>();
        statusMap.put("CHUA_XU_LY", "Chưa xử lý");
        statusMap.put("DANG_XU_LY", "Đang xử lý");
        statusMap.put("DA_XU_LY", "Đã xử lý");
        modelAndView.addObject("customerEdit", customerDTO);
        modelAndView.addObject("statusMap", statusMap);
        return modelAndView;
    }

    @RequestMapping(value = "/admin/customer-edit-{id}", method = RequestMethod.GET)
    public ModelAndView customerEdit(@PathVariable long id, HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView("admin/customer/edit");
        Map<String, String> statusMap = new HashMap<>();
        statusMap.put("CHUA_XU_LY", "Chưa xử lý");
        statusMap.put("DANG_XU_LY", "Đang xử lý");
        statusMap.put("DA_XU_LY", "Đã xử lý");
        modelAndView.addObject("customerEdit", customerService.getCustomer(id));
        modelAndView.addObject("transactionType", TransactionType.getTypeMap());
        modelAndView.addObject("listCSKH", transactionService.getListTransactionDTO("CSKH", id));
        modelAndView.addObject("listDDX", transactionService.getListTransactionDTO("DDX", id));
        modelAndView.addObject("statusMap", statusMap);
        return modelAndView;
    }
}
