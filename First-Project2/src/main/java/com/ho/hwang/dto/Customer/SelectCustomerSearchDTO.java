package com.ho.hwang.dto.Customer;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class SelectCustomerSearchDTO {
    private int customer_id;
    private String customer_name;
    private String address_address;
    private String department_name;
    private String employee_name;
    private String employee_contact;
    private String address_detail;

}
