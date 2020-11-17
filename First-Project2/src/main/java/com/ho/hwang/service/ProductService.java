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
    public List<SelectProductDTO> selectSearchAllProduct(){
        return mapper.selectSearchAllProduct();
    }

    //납품정보 삭제
    public int deleteDelivery(List<Integer> charr) {
        String deleteList = charr.stream().map(n -> n.toString()).collect(Collectors.joining(","));
        Optional<String> op = Optional.ofNullable(deleteList);
        return mapper.deleteDelivery(op.orElse(""));
    }

    public void insertDelivery(InsertDeliveryDTO insertDeliveryDTO) {

        mapper.insertDelivery(insertDeliveryDTO);
        int delivery_id = mapper.selectDelivery_id();

        // window 입력
        if (insertDeliveryDTO.getWindow() != 0) {
            insertDeliveryDTO.setDelivery_id(delivery_id);
            insertDeliveryDTO.setOs_name("Window");
            insertDeliveryDTO.setOs_quantity(insertDeliveryDTO.getWindow());
            mapper.insertOS(insertDeliveryDTO);
        }
        // Linux 입력
        if (insertDeliveryDTO.getLinux() != 0) {
            insertDeliveryDTO.setDelivery_id(delivery_id);
            insertDeliveryDTO.setOs_name("Linux");
            insertDeliveryDTO.setOs_quantity(insertDeliveryDTO.getLinux());
            mapper.insertOS(insertDeliveryDTO);
        }
        // Unix 입력
        if (insertDeliveryDTO.getUnix() != 0) {
            insertDeliveryDTO.setDelivery_id(delivery_id);
            insertDeliveryDTO.setOs_name("Unix");
            insertDeliveryDTO.setOs_quantity(insertDeliveryDTO.getUnix());
            mapper.insertOS(insertDeliveryDTO);
        }

    }

    public List<SelectTotalDeliveryDTO> selectTotalDelivery(){
        return mapper.selectTotalDelivery();
    }

    public List<SelectTotalOsDTO> selectTotalOS(){
        return mapper.selectTotalOS();
    }

    public List<SelectDeliveryDTO> selectDelivery(int co_id){
        return mapper.selectDelivery(co_id);
    }

    public List<SelectTotalOsDTO> selectOS(int co_id){
        return mapper.selectOS(co_id);
    }
}
