package com.ho.hwang.dto.Product;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
@AllArgsConstructor
public class SelectCustomerProductDto {
    private String productName;
    private int deliveryQuantity;
    private Date deliveryDate;
    private int deliveryBusinessNum;
    private int customerId;
    private int productId;
}
