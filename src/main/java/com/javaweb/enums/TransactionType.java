package com.javaweb.enums;

import java.util.HashMap;
import java.util.Map;

public enum TransactionType {
    CSKH("CHĂM SÓC KHÁCH HÀNG"),
    DDX("DẪN ĐI XEM");
    private final String name;
    TransactionType(String name) {
        this.name = name;
    }

    private static Map<String, String> typeMap = new HashMap<>();
    static {
        for (TransactionType type : TransactionType.values()) {
            typeMap.put(type.name(), type.name);
        }
    }
    public static Map<String, String> getTypeMap() {
        return typeMap;
    }
}
