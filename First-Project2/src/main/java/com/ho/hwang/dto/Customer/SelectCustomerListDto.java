package com.ho.hwang.dto.Customer;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class SelectCustomerListDTO{
    private int customerId;
    private String customerName;
    private String addressAddress;
    private String addressDetail;
    private String manager;
    private String se;
    private String sales;
}