package com.ho.hwang.dto.Customer;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UpdateCustomerDetailDto {
    private int employeeIdManager;
    private int employeeIdSe;
    private int employeeIdSales;
    private int customerId;
    private int managerHistoryType;
    //주소 변경 미적용
    private String addressAddress;
    private String addressPost;
    private String addressDetail;
}