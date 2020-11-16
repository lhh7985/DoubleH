package com.ho.hwang.service;

import com.ho.hwang.dto.Product.*;
import com.ho.hwang.mappers.UserMapper;
import com.ho.hwang.vo.OsVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

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
        int result=0;
        if (charr != null) {
            String delivery_id="";
            int index=0;

            for (int i : charr) {
                index++;
                if(index < charr.size()){
                    delivery_id= delivery_id + i + ",";
                }else{
                    delivery_id = delivery_id+ i;
                }
            }
            mapper.deleteCustomer(delivery_id);
            result=1;
        }
        return result;
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

    public List<OsVO> selectOS(int co_id){
        return mapper.selectOS(co_id);
    }
}
