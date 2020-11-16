package com.ho.hwang.dto.Customer;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class InsertCustomerDTO {
    private int customer_id;
    private String customer_name;
    private int employee_id_sales;
    private int employee_id_se;
    private int employee_id_manager;
    private String address_address;
    private String address_post;
    private String address_detail;
}
