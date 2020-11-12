package com.ho.hwang.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ho.hwang.service.CustomerService;
import com.ho.hwang.service.UserService;
import com.ho.hwang.vo.CustomerListVO;
import com.ho.hwang.vo.DeliveryVO;
import com.ho.hwang.vo.EmployeeVO;
import com.ho.hwang.vo.ProductVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/search/*")
public class SearchController {
	
	private final UserService userService;
	private final CustomerService customerService;
	
	@GetMapping("/customer")
	public String searchCustomer(Model model) {
		List<CustomerListVO> customerSearch = customerService.selectCustomer();
		model.addAttribute("customerSearch", customerSearch);
		
		return "search/customer";
	}

	@GetMapping("/product")
	public String searchProduct(Model model, int customer_id) {
		List<DeliveryVO> deliverylist = customerService.selectCustomerProduct(customer_id);
		model.addAttribute("deliverylist", deliverylist);

		return "search/product";
	}

	@GetMapping("/se")
	public String searchSeManager(Model model) {
		List<EmployeeVO> list = userService.selectEmployee_secuve();
		model.addAttribute("list", list);
		
		return "search/employee_se";
	}

	@GetMapping("/sales")
	public String searchSalesManager(Model model) {
		List<EmployeeVO> list = userService.selectEmployee_secuve();
		model.addAttribute("list", list);
		
		return "search/employee_sales";
	}

	@GetMapping("/other")
	public String searchOtherEmployee(Model model) {
		List<EmployeeVO> list = userService.selectEmployee_other();
		model.addAttribute("list", list);
		
		return "search/employee_other";
	}

	// 모든 제품 검색창
	@GetMapping("/product2")
	public String searchProduct2(Model model) {
		List<ProductVO> list = userService.selectSearchProduct2();
		model.addAttribute("list", list);
		
		return "search/product2";
	}

}
