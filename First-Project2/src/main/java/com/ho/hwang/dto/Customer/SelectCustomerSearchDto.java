package com.ho.hwang.dto.Customer;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class SelectCustomerSearchDTO {
    private int customerId;
    private String customerName;
    private String addressAddress;
    private String departmentName;
    private String employeeName;
    private String employeeContact;
    private String addressDetail;

}
