package com.javaweb.api.admin;

import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.service.impl.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController(value="customerAPIOfAdmin")
@RequestMapping("/api/customer")
public class CustomerAPI {
    @Autowired
    private CustomerService customerService;

    @GetMapping("/{id}/staffs")
    public ResponseDTO loadStaffs(@PathVariable Long id) {
        ResponseDTO result = customerService.loadStaffs(id);
        return result;
    }

    @PostMapping
    public void addOrUpdateCustomer(@RequestBody CustomerDTO customerDTO) {
        customerService.addOrUpdateCustomer(customerDTO);
    }

    @DeleteMapping("/{ids}")
    public void deleteCustomer(@PathVariable List<Long> ids) {
        customerService.deleteCustomer(ids);
    }
}
