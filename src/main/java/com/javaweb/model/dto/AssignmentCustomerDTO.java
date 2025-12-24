package com.javaweb.model.dto;
import java.util.List;
public class AssignmentCustomerDTO {
    private long customerId;
    private List<Long> staffs;

    public long getCustomerId() {
        return customerId;
    }

    public void setCustomerId(long customerId) {
        this.customerId = customerId;
    }

    public List<Long> getStaffs() {
        return staffs;
    }

    public void setStaffs(List<Long> staffs) {
        this.staffs = staffs;
    }
}
