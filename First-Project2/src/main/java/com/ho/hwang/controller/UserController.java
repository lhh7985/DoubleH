package com.ho.hwang.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ho.hwang.service.CustomerService;
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
	public String getPatchList() {
		return "patch";
	}

	// ==================================팝업창 매핑
	
	// ==================================사원
	@GetMapping("/employee/list")
	public String getEmployeeList(Model model) {
		return "employee/list";
	}

	@GetMapping("/employee/secuve")
	public String getSecuveEmployee(Model model) {
		List<EmployeeVO> empvo = userService.selectEmployee_secuve();
		model.addAttribute("list", empvo);

		return "employee/secuve";
	}

	@GetMapping("/employee/others")
	public String getOtherEmployee(Model model) {
		List<EmployeeVO> empvo = userService.selectEmployee_other();
		model.addAttribute("list", empvo);

		return "employee/others";
	}

	@GetMapping("/employee/enroll")
	public String enrollEmployee(Model model) {
		List<String> list = userService.selectEmployee_type();
		List<String> deptName = userService.selectDept_name();
		model.addAttribute("type", list);
		model.addAttribute("dept", deptName);
		
		return "employee/enroll";
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
	@PostMapping("/employee/enroll")
	public void enrollEmployee(EmployeeVO employeeVO) {
		int type = userService.selectCode(employeeVO.getType());
		employeeVO.setEmployee_type(type);
		int dept = userService.selectDept(employeeVO.getDept());
		employeeVO.setDepartment_id(dept);
		userService.insertEmployee(employeeVO);
	}

}
