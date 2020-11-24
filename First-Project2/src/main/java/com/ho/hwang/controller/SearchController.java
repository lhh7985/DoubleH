package com.ho.hwang.controller;

import java.util.List;

import com.ho.hwang.dto.Customer.SelectCustomerSearchDTO;
import com.ho.hwang.dto.Employee.SelectEmployeeOtherDTO;
import com.ho.hwang.dto.Employee.SelectEmployeeSecuveDTO;
import com.ho.hwang.dto.Product.SelectCustomerProductDTO;
import com.ho.hwang.dto.Product.SelectProductDTO;
import com.ho.hwang.paging.Page;
import com.ho.hwang.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ho.hwang.service.CustomerService;
import com.ho.hwang.service.UserService;
import com.ho.hwang.vo.CustomerListVO;


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
		List<SelectCustomerSearchDTO> customerSearch = customerService.selectCustomer();
		model.addAttribute("customerSearch", customerSearch);
		
		return "search/customer";
	}

	@GetMapping("/product")
	public String searchProduct(Model model, int customerId) {
		List<SelectCustomerProductDTO> deliverylist = customerService.selectCustomerProduct(customerId);
		model.addAttribute("deliverylist", deliverylist);

		return "search/product";
	}

	@GetMapping("/se")
	public String searchSeManager(Model model) {
		List<SelectEmployeeSecuveDTO> list = userService.selectEmployee_secuve();
		model.addAttribute("list", list);
		
		return "search/employee_se";
	}

	@GetMapping("/sales")
	public String searchSalesManager(Model model) {
		List<SelectEmployeeSecuveDTO> list = userService.selectEmployee_secuve();
		model.addAttribute("list", list);
		
		return "search/employee_sales";
	}

	@GetMapping("/other")
	public String searchOtherEmployee(Model model) {
		List<SelectEmployeeOtherDTO> list = userService.selectEmployee_other();
		model.addAttribute("list", list);
		
		return "search/employee_other";
	}

	// 모든 제품 검색창
	@GetMapping("/allproduct")
	public String searchAllProduct(@RequestParam(defaultValue = "1") int page, Model model) {

		int listCnt = productService.selectDeliveryTotalCount();
		Page paging = new Page(listCnt, page);

		List<SelectProductDTO> list = productService.selectSearchAllProduct(paging.getStartIndex(), paging.getPageSize());
		model.addAttribute("list", list);
		
		return "search/AllProduct";
	}

}
