package com.ho.hwang.dto.Product;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class SelectProductDTO{
    private int product_id;
    private String product_name;
    private String product_content;
}
