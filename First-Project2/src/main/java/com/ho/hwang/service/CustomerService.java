package com.ho.hwang.service;

import java.util.List;
import java.util.stream.Collectors;

import com.ho.hwang.dto.Customer.*;
import com.ho.hwang.dto.ManagerHistory.SelectManagerDto;
import com.ho.hwang.dto.ManagerHistory.UpdateManagerHistoryDto;
import com.ho.hwang.dto.Product.SelectCustomerProductDto;
import com.ho.hwang.vo.*;
import org.springframework.stereotype.Service;

import com.ho.hwang.mappers.UserMapper;

import lombok.RequiredArgsConstructor;

import static java.util.stream.Collectors.joining;

@Service
@RequiredArgsConstructor
public class CustomerService {

	private final UserMapper mapper;
	
	public List<SelectCustomerSearchDto> selectCustomer(){
		return mapper.selectCustomer();
	}

	
	public List<CustomerListVo> selectCustomerList(int start, int cntPerPage){
		return mapper.selectCustomerList(start, cntPerPage);
	}

	public CustomerVo selectCustomerDetail(int customerId) {
		return mapper.selectCustomerDetail(customerId);
	}

	public List<SelectCustomerProductDto> selectCustomerProduct(int customerId) {
		return mapper.selectCustomerProduct(customerId);
	}
	
	public void insertCustomer(InsertCustomerDto insertCustomerDto) {
		mapper.insertCustomer(insertCustomerDto);
		int customerID = mapper.selectCustomer_id();
		insertCustomerDto.setCustomerId(customerID);
		mapper.insertAddress(insertCustomerDto);

		//매니저 이력 삽입
		UpdateManagerHistoryDto managerHistory = new UpdateManagerHistoryDto(customerID);

		//manager
		managerHistory.setEmployeeId(insertCustomerDto.getEmployeeIdManager());
		managerHistory.setManagerHistoryType(19);
		mapper.insertManagerHistory(managerHistory);

		//se
		managerHistory.setEmployeeId(insertCustomerDto.getEmployeeIdSe());
		managerHistory.setManagerHistoryType(20);
		mapper.insertManagerHistory(managerHistory);

		//sales
		managerHistory.setEmployeeId(insertCustomerDto.getEmployeeIdSales());
		managerHistory.setManagerHistoryType(21);
		mapper.insertManagerHistory(managerHistory);
	}
	
	//담당자 수정e
	public void updateCustomerDetail(UpdateCustomerDetailDto updateCustomerDetailDto) {
		UpdateManagerHistoryDto manager = new UpdateManagerHistoryDto(updateCustomerDetailDto.getCustomerId());

		if(updateCustomerDetailDto.getEmployeeIdManager() !=0){
			// 오늘날짜 현재 담당자 endDate에 찍기
			manager.setManagerHistoryType(19);
			mapper.updateEnddate(manager);

			//새로운 담당자를 오늘 날짜로 Start에 추가하기
			manager.setEmployeeId(updateCustomerDetailDto.getEmployeeIdManager());
			mapper.insertManagerHistory(manager);
			mapper.updateManager(updateCustomerDetailDto);
		}
		if(updateCustomerDetailDto.getEmployeeIdSe() !=0){
			// 오늘날짜 현재 담당자 endDate에 찍기
			manager.setManagerHistoryType(20);
			mapper.updateEnddate(manager);

			//새로운 담당자를 오늘 날짜로 Start에 추가하기
			manager.setEmployeeId(updateCustomerDetailDto.getEmployeeIdSe());
			mapper.insertManagerHistory(manager);
			mapper.updateSE(updateCustomerDetailDto);
		}
		if(updateCustomerDetailDto.getEmployeeIdSales() !=0){
			// 오늘날짜 현재 담당자 endDate에 찍기
			manager.setManagerHistoryType(21);
			mapper.updateEnddate(manager);

			//새로운 담당자를 오늘 날짜로 Start에 추가하기
			manager.setEmployeeId(updateCustomerDetailDto.getEmployeeIdSales());
			mapper.insertManagerHistory(manager);
			mapper.updateSales(updateCustomerDetailDto);
		}
	}

	
	//담당자 이력
	public List<SelectManagerDto> selectManager(int customerId){
		return mapper.selectManager(customerId);
	}

	//고객 목록 삭제
	public int deleteCustomer(List<Integer> charr) {
		String deleteList = charr.stream().map(n -> n.toString()).collect(Collectors.joining(","));
		return mapper.deleteCustomer(deleteList);
	}
	
	//총 고객사 수
	public int selectCustomerTotalCount(){
		return mapper.selectCustomerTotalCount();
	}
}
