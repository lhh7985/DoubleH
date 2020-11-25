package com.ho.hwang.service;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import com.ho.hwang.dto.Customer.*;
import com.ho.hwang.dto.ManagerHistory.SelectManagerDTO;
import com.ho.hwang.dto.ManagerHistory.UpdateManagerHistoryDTO;
import com.ho.hwang.dto.Product.SelectCustomerProductDTO;
import com.ho.hwang.vo.*;
import org.springframework.stereotype.Service;

import com.ho.hwang.mappers.UserMapper;

import lombok.RequiredArgsConstructor;

import static java.util.stream.Collectors.joining;

@Service
@RequiredArgsConstructor
public class CustomerService {

	private final UserMapper mapper;
	
	public List<SelectCustomerSearchDTO> selectCustomer(){
		return mapper.selectCustomer();
	}

	
	public List<CustomerListVO> selectCustomerList(int start, int cntPerPage){
		return mapper.selectCustomerList(start, cntPerPage);
	}

	public CustomerVO selectCustomerDetail(int customerId) {
		return mapper.selectCustomerDetail(customerId);
	}

	public List<SelectCustomerProductDTO> selectCustomerProduct(int customerId) {
		return mapper.selectCustomerProduct(customerId);
	}
	
	public void insertCustomer(InsertCustomerDTO insertCustomerDTO) {
		mapper.insertCustomer(insertCustomerDTO);
		int customerID = mapper.selectCustomer_id();
		insertCustomerDTO.setCustomerId(customerID);
		mapper.insertAddress(insertCustomerDTO);

		//매니저 이력 삽입
		UpdateManagerHistoryDTO managerHistory = new UpdateManagerHistoryDTO(x);

		//manager
		managerHistory.setEmployeeId(insertCustomerDTO.getEmployeeIdManager());
		managerHistory.setManagerHistoryType(19);
		mapper.insertManagerHistory(managerHistory);

		//se
		managerHistory.setEmployeeId(insertCustomerDTO.getEmployeeIdSe());
		managerHistory.setManagerHistoryType(20);
		mapper.insertManagerHistory(managerHistory);

		//sales
		managerHistory.setEmployeeId(insertCustomerDTO.getEmployeeIdSales());
		managerHistory.setManagerHistoryType(21);
		mapper.insertManagerHistory(managerHistory);
	}
	
	//담당자 수정e
	public void updateCustomerDetail(UpdateCustomerDetailDTO updateCustomerDetailDTO) {
		UpdateManagerHistoryDTO manager = new UpdateManagerHistoryDTO(updateCustomerDetailDTO.getCustomerId());

		if(updateCustomerDetailDTO.getEmployeeIdManager() !=0){
			// 오늘날짜 현재 담당자 endDate에 찍기
			manager.setManagerHistoryType(19);
			mapper.updateEnddate(manager);

			//새로운 담당자를 오늘 날짜로 Start에 추가하기
			manager.setEmployeeId(updateCustomerDetailDTO.getEmployeeIdManager());
			mapper.insertManagerHistory(manager);
			mapper.updateManager(updateCustomerDetailDTO);
		}
		if(updateCustomerDetailDTO.getEmployeeIdSe() !=0){
			// 오늘날짜 현재 담당자 endDate에 찍기
			manager.setManagerHistoryType(20);
			mapper.updateEnddate(manager);

			//새로운 담당자를 오늘 날짜로 Start에 추가하기
			manager.setEmployeeId(updateCustomerDetailDTO.getEmployeeIdSe());
			mapper.insertManagerHistory(manager);
			mapper.updateSE(updateCustomerDetailDTO);
		}
		if(updateCustomerDetailDTO.getEmployeeIdSales() !=0){
			// 오늘날짜 현재 담당자 endDate에 찍기
			manager.setManagerHistoryType(21);
			mapper.updateEnddate(manager);

			//새로운 담당자를 오늘 날짜로 Start에 추가하기
			manager.setEmployeeId(updateCustomerDetailDTO.getEmployeeIdSales());
			mapper.insertManagerHistory(manager);
			mapper.updateSales(updateCustomerDetailDTO);
		}
	}

	
	//담당자 이력
	public List<SelectManagerDTO> selectManager(int customerId){
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
