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

    public List<SelectProductDTO> selectProduct(){
        return mapper.selectProduct();
    }
    public List<SelectProductDTO> selectSearchAllProduct(int start, int cntPerPage){
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

    public void insertDelivery(InsertDeliveryDTO insertDeliveryDTO) {

        mapper.insertDelivery(insertDeliveryDTO);
        int deliveryId = mapper.selectDelivery_id();

        // window 입력
        if (insertDeliveryDTO.getWindow() != 0) {
            insertDeliveryDTO.setDeliveryId(deliveryId);
            insertDeliveryDTO.setOsName("Window");
            insertDeliveryDTO.setOsQuantity(insertDeliveryDTO.getWindow());
            mapper.insertOS(insertDeliveryDTO);
        }
        // Linux 입력
        if (insertDeliveryDTO.getLinux() != 0) {
            insertDeliveryDTO.setDeliveryId(deliveryId);
            insertDeliveryDTO.setOsName("Linux");
            insertDeliveryDTO.setOsQuantity(insertDeliveryDTO.getLinux());
            mapper.insertOS(insertDeliveryDTO);
        }
        // Unix 입력
        if (insertDeliveryDTO.getUnix() != 0) {
            insertDeliveryDTO.setDeliveryId(deliveryId);
            insertDeliveryDTO.setOsName("Unix");
            insertDeliveryDTO.setOsQuantity(insertDeliveryDTO.getUnix());
            mapper.insertOS(insertDeliveryDTO);
        }

    }

    public List<SelectTotalDeliveryDTO> selectTotalDelivery(int start, int cntPerPage){
        return mapper.selectTotalDelivery(start, cntPerPage);
    }

    public List<SelectTotalOsDTO> selectTotalOS(){
        return mapper.selectTotalOS();
    }

    public List<SelectDeliveryDTO> selectDelivery(int coId){
        return mapper.selectDelivery(coId);
    }

    public List<SelectTotalOsDTO> selectOS(int coId){
        return mapper.selectOS(coId);
    }
}
