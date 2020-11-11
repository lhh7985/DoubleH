package com.ho.hwang.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ho.hwang.mappers.UserMapper;
import com.ho.hwang.vo.CustomerListVO;
import com.ho.hwang.vo.CustomerVO;
import com.ho.hwang.vo.DeliveryVO;

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
	
	public int selectCustomer_id() {
		return mapper.selectCustomer_id();
	}
}
