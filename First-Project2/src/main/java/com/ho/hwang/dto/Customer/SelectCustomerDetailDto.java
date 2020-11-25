package com.ho.hwang.dto.Customer;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class SelectCustomerDetailDto {
    private String customerName;
    private String addressAddress;
    private int addressPost;
    private String addressDetail;
    private int employeeIdSales;
    private int employeeIdSe;
    private int employeeIdManager;
    private int customerId;
}