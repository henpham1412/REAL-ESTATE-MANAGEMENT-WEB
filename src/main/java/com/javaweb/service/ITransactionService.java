package com.javaweb.service;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.dto.TransactionDTO;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;

@Service
public interface ITransactionService {
    List<TransactionDTO> getListTransactionDTO(String code, Long customerId);
    void addOrUpdateTransaction(TransactionDTO transactionDTO);
}
