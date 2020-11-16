package com.ho.hwang.dto.Product;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
@AllArgsConstructor
public class SelectTotalDeliveryDTO{
    private int delivery_businessNum;
    private String customer_name;
    private String product_name;
    private int delivery_quantity;
    private Date delivery_date;
    private int customer_id;
    private int delivery_id;
}
