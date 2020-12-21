package com.ho.hwang.mappers;

import com.ho.hwang.dto.Product.*;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface ProductMapper {
    //제품 페이지 제품 검색
    int selectProductID(String productName);
    List<SelectProductDto> selectProduct();
    List<SelectProductDto> selectSearchAllProduct();

    void insertDelivery(InsertDeliveryDto insertDeliveryDto);
    int selectDelivery_id();
    List<SelectTotalDeliveryDto> selectTotalDelivery();
    int deleteDelivery(int deliveryId);


    void insertOS(InsertDeliveryDto insertDeliveryDto);

//    List<SelectTotalOsDto> selectTotalOS();
}
