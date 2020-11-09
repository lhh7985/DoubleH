package com.ho.hwang.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ho.hwang.service.UserService;
import com.ho.hwang.vo.CustomerListVO;
import com.ho.hwang.vo.CustomerVO;
import com.ho.hwang.vo.DeliveryVO;
import com.ho.hwang.vo.EmployeeVO;
import com.ho.hwang.vo.ProductVO;
import com.ho.hwang.vo.SrVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class UserController {

	private final UserService userService;


	
	@RequestMapping("/main")
	public String main() {
		return "main";
	}
	
	@RequestMapping("/sr")
	public String SR(Model model) {
		
		List<SrVO> srList = userService.selectSR();
		
		model.addAttribute("srList", srList);
		
		return "SR";
	}
	
	@RequestMapping("/patch")
	public String patch() {
		return "patch";
	}

	
	//==================================팝업창 매핑
	@RequestMapping("/search/customer_search")
	public String co_search(Model model) {
		
		List<CustomerListVO> customerSearch = userService.selectCustomer();
		model.addAttribute("customerSearch", customerSearch);
		return "search/customer_search";
	}
	
	@RequestMapping(value="/search/product_search", method = RequestMethod.GET)
	public String product_search(Model model, int customer_id) {
		
		List<DeliveryVO> deliverylist = userService.selectCustomerProduct(customer_id);
		model.addAttribute("deliverylist", deliverylist);

		return "search/product_search";
	}
	
	@RequestMapping("/search/employee_search_secuve")
	public String employee_search_secuve(Model model) {
		List<EmployeeVO> list = userService.selectEmployee_secuve();
		model.addAttribute("list", list);
		return "search/employee_search";
	}
	
	@RequestMapping("/search/employee_search_secuve2")
	public String employee_search_secuve2(Model model) {
		List<EmployeeVO> list = userService.selectEmployee_secuve();
		model.addAttribute("list", list);
		return "search/employee_search2";
	}
	
	@RequestMapping("/search/employee_searchOther")
	public String employee_search(Model model) {
		
		List<EmployeeVO> list = userService.selectEmployee_other();
		
		model.addAttribute("list", list);
		return "search/employee_searchOther";
	}
	
	//모든 제품 검색창
	@RequestMapping("/search/product_search2")
	public String product_search2(Model model) {
		List<ProductVO> list = userService.selectSearchProduct2();
		model.addAttribute("list", list);
		return "search/product_search2";
	}
	
	
	//==================================사원
	@RequestMapping("/employee/list")
	public String employee(Model model) {
		return "employee/list";
	}
	
	@RequestMapping("/employee/secuve")
	public String secuve(Model model) {
		
		List<EmployeeVO> empvo = userService.selectEmployee_secuve();
		model.addAttribute("list", empvo);
		
		return "employee/secuve";
	}
	
	@RequestMapping("/employee/others")
	public String others(Model model) {
		
		List<EmployeeVO> empvo = userService.selectEmployee_other();
		model.addAttribute("list", empvo);
		
		return "employee/others";
	}
	
	
	@RequestMapping("/employee/add")
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
			result=1;
		}
		
		return result;
	}
	
	//사원 등록 부분
	@RequestMapping(value="/employee/add", method = RequestMethod.POST)
	public void employee_add(EmployeeVO employeeVO) {
		
		
		int type = userService.selectCode(employeeVO.getType());
		employeeVO.setEmployee_type(type);
		
		int dept = userService.selectDept(employeeVO.getDept());
		employeeVO.setDepartment_id(dept);
		
		userService.insertEmployee(employeeVO);
	}
	
	
	//sr 등록부분
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	/*
	 * @RequestMapping("/details/activity_detail") public String
	 * activity_detail(Model model) { return "details/activity_detail"; }
	 */
	
	
	
	
	
	@RequestMapping("/enroll/customer")
	public String custoemr_enroll(Model model) {
		return "enroll/customer_enroll";
	}
	
	//고객사 등록부분
		@RequestMapping(value="/enroll/customer", method = RequestMethod.POST)
		public void customer_enroll(CustomerVO customerVO) {
			
			
			userService.insertCustomer(customerVO);
			
			int x = userService.selectCustomer_id();
			customerVO.setCustomer_id(x);
			userService.insertAddress(customerVO);
		}
	
	
	
}
