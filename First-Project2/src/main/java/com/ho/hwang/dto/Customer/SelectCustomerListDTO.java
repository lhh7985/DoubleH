package com.ho.hwang.dto.Customer;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class SelectCustomerListDTO{
    private int customer_id;
    private String customer_name;
    private String address_address;
    private String address_detail;
    private String manager;
    private String se;
    private String sales;
}