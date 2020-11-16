package com.ho.hwang.dto.Product;

import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
public class InsertDeliveryDTO{
    private int delivery_id;
    private int customer_id;
    private int product_id;
    private int delivery_quantity;
    private Date delivery_date;
    private int delivery_businessNum;
    private String os_name;
    private int os_quantity;
    private int Window;
    private int Linux;
    private int Unix;
}
