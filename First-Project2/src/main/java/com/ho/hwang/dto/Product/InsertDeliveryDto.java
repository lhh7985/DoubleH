package com.ho.hwang.dto.Product;

import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
public class InsertDeliveryDto {
    private int deliveryId;
    private int customerId;
    private int productId;
    private int deliveryQuantity;
    private Date deliveryDate;
    private int deliveryBusinessNum;
    private String osName;
    private int osQuantity;
    private int Window;
    private int Linux;
    private int Unix;
}
