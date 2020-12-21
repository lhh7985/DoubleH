package com.ho.hwang.dto.Product;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;
import java.time.LocalDate;

@Getter
@Setter
@AllArgsConstructor
public class SelectTotalDeliveryDto {
    private int deliveryBusinessNum;
    private String customerName;
    private String productName;
    private int deliveryQuantity;
    private LocalDate deliveryDate;
    private int customerId;
    private int deliveryId;
}
