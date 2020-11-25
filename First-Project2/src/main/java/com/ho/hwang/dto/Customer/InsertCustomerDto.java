package com.ho.hwang.dto.Customer;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class InsertCustomerDTO {
    private int customerId;
    private String customerName;
    private int employeeIdSales;
    private int employeeIdSe;
    private int employeeIdManager;
    private String addressAddress;
    private String addressPost;
    private String addressDetail;
}
