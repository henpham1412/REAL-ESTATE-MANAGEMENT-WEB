package com.javaweb.converter;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.response.CustomerSearchResponse;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class CustomerConverter {
    @Autowired
    private ModelMapper modelMapper;

    public CustomerSearchResponse convertEntityToResponse(CustomerEntity customerEntity) {
        CustomerSearchResponse customerSearchResponse = modelMapper.map(customerEntity, CustomerSearchResponse.class);
        return customerSearchResponse;
    }

    public CustomerEntity convertDTOToEntity(CustomerDTO customerDTO) {
        CustomerEntity customerEntity = modelMapper.map(customerDTO, CustomerEntity.class);
        return customerEntity;
    }

    public CustomerDTO convertEntityToDTO(CustomerEntity customerEntity) {
        CustomerDTO customerDTO = modelMapper.map(customerEntity, CustomerDTO.class);
        return customerDTO;
    }
}
