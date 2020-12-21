package com.ho.hwang.service;

import com.ho.hwang.dto.Product.*;
import com.ho.hwang.mappers.ProductMapper;
import com.ho.hwang.mappers.UserMapper;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class ProductService {

    private final ProductMapper productMapper;

    public List<SelectProductDto> selectProduct(){
        return productMapper.selectProduct();
    }
    public List<SelectProductDto> selectSearchAllProduct(){
        return productMapper.selectSearchAllProduct();
    }
    //납품정보 삭제
    public int deleteDelivery(int deliveryId) {
        return productMapper.deleteDelivery(deliveryId);
    }

    public void insertDelivery(InsertDeliveryDto insertDeliveryDto) {

        productMapper.insertDelivery(insertDeliveryDto);
        int deliveryId = productMapper.selectDelivery_id();

        // window 입력
        if (insertDeliveryDto.getWindow() != 0) {
            insertDeliveryDto.setDeliveryId(deliveryId);
            insertDeliveryDto.setOsName("Window");
            insertDeliveryDto.setOsQuantity(insertDeliveryDto.getWindow());
            productMapper.insertOS(insertDeliveryDto);
        }
        // Linux 입력
        if (insertDeliveryDto.getLinux() != 0) {
            insertDeliveryDto.setDeliveryId(deliveryId);
            insertDeliveryDto.setOsName("Linux");
            insertDeliveryDto.setOsQuantity(insertDeliveryDto.getLinux());
            productMapper.insertOS(insertDeliveryDto);
        }
        // Unix 입력
        if (insertDeliveryDto.getUnix() != 0) {
            insertDeliveryDto.setDeliveryId(deliveryId);
            insertDeliveryDto.setOsName("Unix");
            insertDeliveryDto.setOsQuantity(insertDeliveryDto.getUnix());
            productMapper.insertOS(insertDeliveryDto);
        }

    }

    public List<SelectTotalDeliveryDto> selectTotalDelivery(){
        return productMapper.selectTotalDelivery();
    }


}
