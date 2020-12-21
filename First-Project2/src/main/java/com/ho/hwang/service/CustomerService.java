package com.ho.hwang.service;

import java.util.List;
import java.util.stream.Collectors;

import com.ho.hwang.dto.Customer.*;
import com.ho.hwang.dto.ManagerHistory.SelectManagerDto;
import com.ho.hwang.dto.ManagerHistory.UpdateManagerHistoryDto;
import com.ho.hwang.dto.Product.SelectCustomerProductDto;
import com.ho.hwang.dto.Product.SelectDeliveryDto;
import com.ho.hwang.dto.Product.SelectTotalOsDto;
import com.ho.hwang.mappers.CustomerMapper;
import com.ho.hwang.vo.*;
import org.springframework.stereotype.Service;

import com.ho.hwang.mappers.UserMapper;

import lombok.RequiredArgsConstructor;

import static java.util.stream.Collectors.joining;

@Service
@RequiredArgsConstructor
public class CustomerService {

	private final CustomerMapper customerMapper;
	
	public List<SelectCustomerSearchDto> selectCustomer(){
		return customerMapper.selectCustomer();
	}

	
	public List<CustomerListVo> selectCustomerList(){
		return customerMapper.selectCustomerList();
	}

	public CustomerVo selectCustomerDetail(int customerId) {
		return customerMapper.selectCustomerDetail(customerId);
	}

	public List<SelectCustomerProductDto> selectCustomerProduct(int customerId) {
		return customerMapper.selectCustomerProduct(customerId);
	}
	
	public void insertCustomer(InsertCustomerDto insertCustomerDto) {
		customerMapper.insertCustomer(insertCustomerDto);
		int customerId = customerMapper.selectCustomer_id();
		insertCustomerDto.setCustomerId(customerId);
		customerMapper.insertAddress(insertCustomerDto);

		//매니저 이력 삽입
		UpdateManagerHistoryDto managerHistory = new UpdateManagerHistoryDto(customerId);

		//manager
		managerHistory.setEmployeeId(insertCustomerDto.getEmployeeIdManager());
		managerHistory.setManagerHistoryType(19);
		customerMapper.insertManagerHistory(managerHistory);

		//se
		managerHistory.setEmployeeId(insertCustomerDto.getEmployeeIdSe());
		managerHistory.setManagerHistoryType(20);
		customerMapper.insertManagerHistory(managerHistory);

		//sales
		managerHistory.setEmployeeId(insertCustomerDto.getEmployeeIdSales());
		managerHistory.setManagerHistoryType(21);
		customerMapper.insertManagerHistory(managerHistory);
	}
	
	//담당자 수정e
	public void updateCustomerDetail(UpdateCustomerDetailDto updateCustomerDetailDto) {
		UpdateManagerHistoryDto manager = new UpdateManagerHistoryDto(updateCustomerDetailDto.getCustomerId());

		if(updateCustomerDetailDto.getEmployeeIdManager() !=0){
			// 오늘날짜 현재 담당자 endDate에 찍기
			manager.setManagerHistoryType(19);
			customerMapper.updateEnddate(manager);

			//새로운 담당자를 오늘 날짜로 Start에 추가하기
			manager.setEmployeeId(updateCustomerDetailDto.getEmployeeIdManager());
			customerMapper.insertManagerHistory(manager);
			customerMapper.updateManager(updateCustomerDetailDto);
		}
		if(updateCustomerDetailDto.getEmployeeIdSe() !=0){
			// 오늘날짜 현재 담당자 endDate에 찍기
			manager.setManagerHistoryType(20);
			customerMapper.updateEnddate(manager);

			//새로운 담당자를 오늘 날짜로 Start에 추가하기
			manager.setEmployeeId(updateCustomerDetailDto.getEmployeeIdSe());
			customerMapper.insertManagerHistory(manager);
			customerMapper.updateSE(updateCustomerDetailDto);
		}
		if(updateCustomerDetailDto.getEmployeeIdSales() !=0){
			// 오늘날짜 현재 담당자 endDate에 찍기
			manager.setManagerHistoryType(21);
			customerMapper.updateEnddate(manager);

			//새로운 담당자를 오늘 날짜로 Start에 추가하기
			manager.setEmployeeId(updateCustomerDetailDto.getEmployeeIdSales());
			customerMapper.insertManagerHistory(manager);
			customerMapper.updateSales(updateCustomerDetailDto);
		}
	}

	public List<SrVo> selectVisit(int customerId) {
		return customerMapper.selectVisit(customerId);
	}
	
	//담당자 이력
	public List<SelectManagerDto> selectManager(int customerId){
		return customerMapper.selectManager(customerId);
	}

	//고객 목록 삭제
	public int deleteCustomer(int customerId) {
		return customerMapper.deleteCustomer(customerId);
	}


	public List<OsVo> selectOs(int deliveryId){
		return customerMapper.selectOs(deliveryId);
	}

	public List<SelectDeliveryDto> selectDelivery(int coId){
		return customerMapper.selectDelivery(coId);
	}

	public List<SelectTotalOsDto> selectOS(int coId){
		return customerMapper.selectOS(coId);
	}
}
