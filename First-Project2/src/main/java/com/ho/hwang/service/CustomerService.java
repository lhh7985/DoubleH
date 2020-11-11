package com.ho.hwang.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ho.hwang.mappers.UserMapper;
import com.ho.hwang.vo.CustomerListVO;
import com.ho.hwang.vo.CustomerVO;
import com.ho.hwang.vo.DeliveryVO;
import com.ho.hwang.vo.ManagerHistoryVO;
import com.ho.hwang.vo.ManagerVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CustomerService {
	
	private final UserMapper mapper;
	
	public List<CustomerListVO> selectCustomer(){
		return mapper.selectCustomer();
	}
	
	public List<CustomerListVO> selectCustomerList(){
		return mapper.selectCustomerList();
	}
	
	public CustomerVO selectCustomerDetail(int co_id) {
		return mapper.selectCustomerDetail(co_id);
	}

	public List<DeliveryVO> selectCustomerProduct(int customer_id) {
		return mapper.selectCustomerProduct(customer_id);
	}
	
	public void insertCustomer(CustomerVO customerVO) {
		mapper.insertCustomer(customerVO);
	}
	
	public void updateEnddate(ManagerHistoryVO managerHistoryVO) {
		mapper.updateEnddate(managerHistoryVO);
	}
	
	public void insertManagerHistory(ManagerHistoryVO managerHistoryVO) {
		mapper.insertManagerHistory(managerHistoryVO);
	}
	
	public int selectCustomer_id() {
		return mapper.selectCustomer_id();
	}
	
	//담당자 수정
	public void updateManager(CustomerVO customerVO) {
		mapper.updateManager(customerVO);
	}
	public void updateSE(CustomerVO customerVO) {
		mapper.updateSE(customerVO);
	}
	public void updateSales(CustomerVO customerVO) {
		mapper.updateSales(customerVO);
	}
	
	//담당자 이력
	public List<ManagerVO> selectManager(int customer_id){
		return mapper.selectManager(customer_id);
	}
}
