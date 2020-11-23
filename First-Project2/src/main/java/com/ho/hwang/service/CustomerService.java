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

	
	public List<SelectCustomerListDTO> selectCustomerList(int start, int cntPerPage){
		return mapper.selectCustomerList(start, cntPerPage);
	}

	public CustomerVO selectCustomerDetail(int customer_id) {
		return mapper.selectCustomerDetail(customer_id);
	}

	public List<SelectCustomerProductDTO> selectCustomerProduct(int customer_id) {
		return mapper.selectCustomerProduct(customer_id);
	}
	
	public void insertCustomer(InsertCustomerDTO insertCustomerDTO) {
		mapper.insertCustomer(insertCustomerDTO);
		int x = mapper.selectCustomer_id();
		insertCustomerDTO.setCustomer_id(x);
		mapper.insertAddress(insertCustomerDTO);

		//매니저 이력 삽입
		UpdateManagerHistoryDTO managerHistory = new UpdateManagerHistoryDTO(x);

		//manager
		managerHistory.setEmployee_id(insertCustomerDTO.getEmployee_id_manager());
		managerHistory.setManagerHistory_type(19);
		mapper.insertManagerHistory(managerHistory);

		//se
		managerHistory.setEmployee_id(insertCustomerDTO.getEmployee_id_se());
		managerHistory.setManagerHistory_type(20);
		mapper.insertManagerHistory(managerHistory);

		//sales
		managerHistory.setEmployee_id(insertCustomerDTO.getEmployee_id_sales());
		managerHistory.setManagerHistory_type(21);
		mapper.insertManagerHistory(managerHistory);
	}
	
	//담당자 수정e
	public void updateCustomerDetail(UpdateCustomerDetailDTO updateCustomerDetailDTO) {
		UpdateManagerHistoryDTO manager = new UpdateManagerHistoryDTO(updateCustomerDetailDTO.getCustomer_id());

		if(updateCustomerDetailDTO.getEmployee_id_manager() !=0){
			// 오늘날짜 현재 담당자 endDate에 찍기
			manager.setManagerHistory_type(19);
			mapper.updateEnddate(manager);

			//새로운 담당자를 오늘 날짜로 Start에 추가하기
			manager.setEmployee_id(updateCustomerDetailDTO.getEmployee_id_manager());
			mapper.insertManagerHistory(manager);
			mapper.updateManager(updateCustomerDetailDTO);
		}
		if(updateCustomerDetailDTO.getEmployee_id_se() !=0){
			// 오늘날짜 현재 담당자 endDate에 찍기
			manager.setManagerHistory_type(20);
			mapper.updateEnddate(manager);

			//새로운 담당자를 오늘 날짜로 Start에 추가하기
			manager.setEmployee_id(updateCustomerDetailDTO.getEmployee_id_se());
			mapper.insertManagerHistory(manager);
			mapper.updateSE(updateCustomerDetailDTO);
		}
		if(updateCustomerDetailDTO.getEmployee_id_sales() !=0){
			// 오늘날짜 현재 담당자 endDate에 찍기
			manager.setManagerHistory_type(21);
			mapper.updateEnddate(manager);

			//새로운 담당자를 오늘 날짜로 Start에 추가하기
			manager.setEmployee_id(updateCustomerDetailDTO.getEmployee_id_sales());
			mapper.insertManagerHistory(manager);
			mapper.updateSales(updateCustomerDetailDTO);
		}
	}

	
	//담당자 이력
	public List<SelectManagerDTO> selectManager(int customer_id){
		return mapper.selectManager(customer_id);
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
