package com.ho.hwang.mappers;

import com.ho.hwang.dto.Customer.InsertCustomerDto;
import com.ho.hwang.dto.Customer.SelectCustomerSearchDto;
import com.ho.hwang.dto.Customer.UpdateCustomerDetailDto;
import com.ho.hwang.dto.ManagerHistory.SelectManagerDto;
import com.ho.hwang.dto.ManagerHistory.UpdateManagerHistoryDto;
import com.ho.hwang.dto.Product.SelectCustomerProductDto;
import com.ho.hwang.dto.Product.SelectDeliveryDto;
import com.ho.hwang.dto.Product.SelectTotalOsDto;
import com.ho.hwang.vo.*;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface CustomerMapper {

    List<SelectCustomerSearchDto> selectCustomer();
    List<CustomerListVo> selectCustomerList();

    CustomerVo selectCustomerDetail(int coId);

    List<SelectCustomerProductDto> selectCustomerProduct(int customerId);
    int selectCustomerID(String name);
    void insertCustomer(InsertCustomerDto insertCustomerDto);
    int selectCustomer_id();

    void insertAddress(InsertCustomerDto insertCustomerDto);
    //각 고객사별 활동 등록 과 검색
    void insertCustomerActivity(ActivityVo activityVo);
    List<ActivityVo> selectCustomerActivity(int srId);

    //고객사 리스트 삭제
    int deleteCustomer(int customerId);

    void updateManager(UpdateCustomerDetailDto updateCustomerDetailDto);
    void updateSE(UpdateCustomerDetailDto updateCustomerDetailDto);
    void updateSales(UpdateCustomerDetailDto updateCustomerDetailDto);

    void insertManagerHistory(UpdateManagerHistoryDto updateManagerHistoryDto);
    //고객사 정보 수정
    void updateEnddate(UpdateManagerHistoryDto updateManagerHistoryDto);

    //고객사 방문내역확인
    List<SrVo> selectVisit(int customerId);

    List<OsVo> selectOs(int deliveryId);

    //담당자이력
    List<SelectManagerDto> selectManager(int customerId);

    List<SelectDeliveryDto> selectDelivery(int coId);

    List<SelectTotalOsDto> selectOS(int coId);




}
