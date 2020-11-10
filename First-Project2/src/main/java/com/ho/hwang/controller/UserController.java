package com.ho.hwang.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ho.hwang.service.UserService;
import com.ho.hwang.vo.CustomerListVO;
import com.ho.hwang.vo.DeliveryVO;
import com.ho.hwang.vo.EmployeeVO;
import com.ho.hwang.vo.ProductVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class UserController {

	private final UserService userService;

	@GetMapping("/main")
	public String main() {
		return "main";
	}

	@GetMapping("/patch")
	public String patch() {
		return "patch";
	}

	// ==================================팝업창 매핑
	@GetMapping("/search/customer_search")
	public String co_search(Model model) {
		List<CustomerListVO> customerSearch = userService.selectCustomer();
		model.addAttribute("customerSearch", customerSearch);
		
		return "search/customer_search";
	}

	@GetMapping("/search/product_search")
	public String product_search(Model model, int customer_id) {
		List<DeliveryVO> deliverylist = userService.selectCustomerProduct(customer_id);
		model.addAttribute("deliverylist", deliverylist);

		return "search/product_search";
	}

	@GetMapping("/search/employee_search_secuve")
	public String employee_search_secuve(Model model) {
		List<EmployeeVO> list = userService.selectEmployee_secuve();
		model.addAttribute("list", list);
		
		return "search/employee_search";
	}

	@GetMapping("/search/employee_search_secuve2")
	public String employee_search_secuve2(Model model) {
		List<EmployeeVO> list = userService.selectEmployee_secuve();
		model.addAttribute("list", list);
		
		return "search/employee_search2";
	}

	@GetMapping("/search/employee_searchOther")
	public String employee_search(Model model) {
		List<EmployeeVO> list = userService.selectEmployee_other();
		model.addAttribute("list", list);
		
		return "search/employee_searchOther";
	}

	// 모든 제품 검색창
	@GetMapping("/search/product_search2")
	public String product_search2(Model model) {
		List<ProductVO> list = userService.selectSearchProduct2();
		model.addAttribute("list", list);
		
		return "search/product_search2";
	}

	// ==================================사원
	@GetMapping("/employee/list")
	public String employee(Model model) {
		return "employee/list";
	}

	@GetMapping("/employee/secuve")
	public String secuve(Model model) {
		List<EmployeeVO> empvo = userService.selectEmployee_secuve();
		model.addAttribute("list", empvo);

		return "employee/secuve";
	}

	@GetMapping("/employee/others")
	public String others(Model model) {
		List<EmployeeVO> empvo = userService.selectEmployee_other();
		model.addAttribute("list", empvo);

		return "employee/others";
	}

	@GetMapping("/employee/add")
	public String employee_add(Model model) {
		List<String> list = userService.selectEmployee_type();
		List<String> deptName = userService.selectDept_name();
		model.addAttribute("type", list);
		model.addAttribute("dept", deptName);
		
		return "employee/add";
	}

	@PostMapping("/employee/delete")
	@ResponseBody
	public int deleteCode(@RequestParam(value = "chbox[]") List<Integer> charr) throws Exception {
		int result = 0;
		if (charr != null) {
			for (int i : charr) {
				userService.deleteEmployee(i);
			}
			result = 1;
		}
		return result;
	}

	// 사원 등록 부분
	@PostMapping("/employee/add")
	public void employee_add(EmployeeVO employeeVO) {
		int type = userService.selectCode(employeeVO.getType());
		employeeVO.setEmployee_type(type);
		int dept = userService.selectDept(employeeVO.getDept());
		employeeVO.setDepartment_id(dept);
		userService.insertEmployee(employeeVO);
	}

}
