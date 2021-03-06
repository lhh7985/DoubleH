package com.ho.hwang.dto.Product;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class SelectTotalOsDto {
    private int deliveryId;
    private String osName;
    private int osQuantity;
}
