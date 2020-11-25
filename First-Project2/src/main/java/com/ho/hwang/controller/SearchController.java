package com.ho.hwang.controller;

import java.util.List;

import com.ho.hwang.dto.Customer.SelectCustomerSearchDto;
import com.ho.hwang.dto.Employee.SelectEmployeeOtherDto;
import com.ho.hwang.dto.Employee.SelectEmployeeSecuveDto;
import com.ho.hwang.dto.Product.SelectCustomerProductDto;
import com.ho.hwang.dto.Product.SelectProductDto;
import com.ho.hwang.paging.Page;
import com.ho.hwang.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ho.hwang.service.CustomerService;
import com.ho.hwang.service.UserService;


import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequiredArgsConstructor
@RequestMapping("/search/*")
public class SearchController {
	
	private final UserService userService;
	private final CustomerService customerService;
	private final ProductService productService;
	
	@GetMapping("/customer")
	public String searchCustomer(Model model) {
		List<SelectCustomerSearchDto> customerSearch = customerService.selectCustomer();
		model.addAttribute("customerSearch", customerSearch);
		
		return "search/customer";
	}

	@GetMapping("/product")
	public String searchProduct(Model model, int customerId) {
		List<SelectCustomerProductDto> deliverylist = customerService.selectCustomerProduct(customerId);
		model.addAttribute("deliverylist", deliverylist);

		return "search/product";
	}

	@GetMapping("/se")
	public String searchSeManager(Model model) {
		List<SelectEmployeeSecuveDto> list = userService.selectEmployee_secuve();
		model.addAttribute("list", list);
		
		return "search/employee_se";
	}

	@GetMapping("/sales")
	public String searchSalesManager(Model model) {
		List<SelectEmployeeSecuveDto> list = userService.selectEmployee_secuve();
		model.addAttribute("list", list);
		
		return "search/employee_sales";
	}

	@GetMapping("/other")
	public String searchOtherEmployee(Model model) {
		List<SelectEmployeeOtherDto> list = userService.selectEmployee_other();
		model.addAttribute("list", list);
		
		return "search/employee_other";
	}

	// 모든 제품 검색창
	@GetMapping("/allproduct")
	public String searchAllProduct(@RequestParam(defaultValue = "1") int page, Model model) {

		int listCnt = productService.selectDeliveryTotalCount();
		Page paging = new Page(listCnt, page);

		List<SelectProductDto> list = productService.selectSearchAllProduct(paging.getStartIndex(), paging.getPageSize());
		model.addAttribute("list", list);
		
		return "search/AllProduct";
	}

}
