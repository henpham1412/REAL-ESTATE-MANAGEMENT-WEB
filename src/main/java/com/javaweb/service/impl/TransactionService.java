package com.javaweb.service.impl;

import com.javaweb.converter.TransactionConverter;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.TransactionEntity;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.TransactionRepository;
import com.javaweb.service.ITransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Service
public class TransactionService implements ITransactionService {
    @Autowired
    private TransactionRepository transactionRepository;

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private TransactionConverter transactionConverter;


    @Override
    public List<TransactionDTO> getListTransactionDTO(String code, Long customerId) {
        List<TransactionEntity> listTrans = transactionRepository.findByCodeAndCustomer_Id(code, customerId);
        List<TransactionDTO> res = new ArrayList<TransactionDTO>();
        for (TransactionEntity entity : listTrans) {
            res.add(transactionConverter.entityToDto(entity));
        }
        return res;
    }

    @Override
    @Transactional
    public void addOrUpdateTransaction(TransactionDTO transactionDTO) {
        TransactionEntity transactionEntity;

        if (transactionDTO.getId() != null) {
            transactionEntity = transactionRepository.findById(transactionDTO.getId()).orElse(null);
            transactionEntity.setNote(transactionDTO.getNote());
        }
        else {
            transactionEntity = transactionConverter.dtoToEntity(transactionDTO);
            if (transactionDTO.getCustomerId() != null) {
                CustomerEntity customerEntity = customerRepository.findById(transactionDTO.getCustomerId()).orElse(null);
                transactionEntity.setCustomer(customerEntity);
            }
        }

        transactionRepository.save(transactionEntity);
    }
}
