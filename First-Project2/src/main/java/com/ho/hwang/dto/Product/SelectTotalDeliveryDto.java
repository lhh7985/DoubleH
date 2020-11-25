package com.ho.hwang.dto.Product;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
@AllArgsConstructor
public class SelectTotalDeliveryDTO{
    private int deliveryBusinessNum;
    private String customerName;
    private String productName;
    private int deliveryQuantity;
    private Date deliveryDate;
    private int customerId;
    private int deliveryId;
}
