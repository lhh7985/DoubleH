package com.ho.hwang.dto.Customer;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UpdateCustomerDetailDTO{
    private int Employee_id_manager;
    private int Employee_id_se;
    private int Employee_id_sales;
    private int customer_id;
    private int ManagerHistory_type;
    //주소 변경 미적용
    private String address_address;
    private String address_post;
    private String address_detail;
}