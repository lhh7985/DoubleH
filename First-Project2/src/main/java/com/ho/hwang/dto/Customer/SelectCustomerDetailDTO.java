package com.ho.hwang.dto.Customer;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class SelectCustomerDetailDTO{
    private String customer_name;
    private String address_address;
    private int address_post;
    private String address_detail;
    private int Employee_ID_Sales;
    private int Employee_ID_SE;
    private int Employee_ID_Manager;
    private int customer_id;
}