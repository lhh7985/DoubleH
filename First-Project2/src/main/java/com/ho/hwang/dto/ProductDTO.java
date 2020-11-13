package com.ho.hwang.dto;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

public class ProductDTO {

    @Getter
    @Setter
    @AllArgsConstructor
    public static class SelectProductDTO{
        private int product_id;
        private String product_name;
        private String product_content;
    }

    @Getter
    @Setter
    @AllArgsConstructor
    public static class SelectTotalDeliveryDTO{
        private int delivery_businessNum;
        private String customer_name;
        private String product_name;
        private int delivery_quantity;
        private Date delivery_date;
        private int customer_id;
        private int delivery_id;
    }

    @Getter
    @Setter
    @AllArgsConstructor
    public static class SelectTotalOsDTO{
        private int delivery_id;
        private String os_name;
        private int os_quantity;
    }

    @Getter
    @Setter
    public static class InsertDeliveryDTO{
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

    @Getter
    @Setter
    @AllArgsConstructor
    public static class SelectCustomerProductDTO{
        private String product_name;
        private int delivery_quantity;
        private Date delivery_date;
        private int delivery_businessNum;
        private int customer_id;
        private int product_id;
    }

    @Getter
    @Setter
    @AllArgsConstructor
    public static class SelectDeliveryDTO{
        private int delivery_id;
        private String customer_name;
        private String product_name;
        private int delivery_quantity;
        private Date delivery_date;
        private int delivery_businessNum;
        private int customer_id;
    }


}
