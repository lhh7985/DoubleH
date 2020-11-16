package com.ho.hwang.dto.Product;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class SelectTotalOsDTO{
    private int delivery_id;
    private String os_name;
    private int os_quantity;
}
