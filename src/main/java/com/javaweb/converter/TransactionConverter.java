package com.javaweb.converter;

import com.javaweb.entity.TransactionEntity;
import com.javaweb.model.dto.TransactionDTO;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class TransactionConverter {
    @Autowired
    ModelMapper modelMapper;

    public TransactionDTO entityToDto(TransactionEntity entity) {
        return modelMapper.map(entity, TransactionDTO.class);
    }

    public TransactionEntity dtoToEntity(TransactionDTO dto) {
        return modelMapper.map(dto, TransactionEntity.class);
    }
}
