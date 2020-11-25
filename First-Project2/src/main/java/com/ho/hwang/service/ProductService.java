package com.ho.hwang.service;

import com.ho.hwang.dto.Product.*;
import com.ho.hwang.mappers.UserMapper;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class ProductService {

    private final UserMapper mapper;

    public List<SelectProductDto> selectProduct(){
        return mapper.selectProduct();
    }
    public List<SelectProductDto> selectSearchAllProduct(int start, int cntPerPage){
        return mapper.selectSearchAllProduct(start, cntPerPage);
    }
    public int selectDeliveryTotalCount(){
        return mapper.selectDeliveryTotalCount();
    }

    //납품정보 삭제
    public int deleteDelivery(List<Integer> charr) {
        String deleteList = charr.stream().map(n -> n.toString()).collect(Collectors.joining(","));
        Optional<String> op = Optional.ofNullable(deleteList);
        return mapper.deleteDelivery(op.orElse(""));
    }

    public void insertDelivery(InsertDeliveryDto insertDeliveryDto) {

        mapper.insertDelivery(insertDeliveryDto);
        int deliveryId = mapper.selectDelivery_id();

        // window 입력
        if (insertDeliveryDto.getWindow() != 0) {
            insertDeliveryDto.setDeliveryId(deliveryId);
            insertDeliveryDto.setOsName("Window");
            insertDeliveryDto.setOsQuantity(insertDeliveryDto.getWindow());
            mapper.insertOS(insertDeliveryDto);
        }
        // Linux 입력
        if (insertDeliveryDto.getLinux() != 0) {
            insertDeliveryDto.setDeliveryId(deliveryId);
            insertDeliveryDto.setOsName("Linux");
            insertDeliveryDto.setOsQuantity(insertDeliveryDto.getLinux());
            mapper.insertOS(insertDeliveryDto);
        }
        // Unix 입력
        if (insertDeliveryDto.getUnix() != 0) {
            insertDeliveryDto.setDeliveryId(deliveryId);
            insertDeliveryDto.setOsName("Unix");
            insertDeliveryDto.setOsQuantity(insertDeliveryDto.getUnix());
            mapper.insertOS(insertDeliveryDto);
        }

    }

    public List<SelectTotalDeliveryDto> selectTotalDelivery(int start, int cntPerPage){
        return mapper.selectTotalDelivery(start, cntPerPage);
    }

    public List<SelectTotalOsDto> selectTotalOS(){
        return mapper.selectTotalOS();
    }

    public List<SelectDeliveryDto> selectDelivery(int coId){
        return mapper.selectDelivery(coId);
    }

    public List<SelectTotalOsDto> selectOS(int coId){
        return mapper.selectOS(coId);
    }
}
