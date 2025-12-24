package com.javaweb.entity;

import javax.persistence.*;

@Entity
@Table(name="transaction")
public class TransactionEntity extends BaseEntity {
    @Column(name="code")
    private String code;

    @Column(name = "note")
    private String note;

//    @Column(name = "customerid")
//    private Long customerId;
//
//    public Long getCustomerId() {
//        return customerId;
//    }
//
//    public void setCustomerId(Long customerId) {
//        this.customerId = customerId;
//    }

    @ManyToOne
    @JoinColumn(name = "customerid")
    private CustomerEntity customer;

    // Nên thêm cả Staff vào đây để biết ai thực hiện giao dịch này
    @ManyToOne
    @JoinColumn(name = "staffid")
    private UserEntity staff;

    public CustomerEntity getCustomer() {
        return customer;
    }

    public void setCustomer(CustomerEntity customer) {
        this.customer = customer;
    }

    public UserEntity getStaff() {
        return staff;
    }

    public void setStaff(UserEntity staff) {
        this.staff = staff;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
}
