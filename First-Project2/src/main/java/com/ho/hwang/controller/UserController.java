package com.ho.hwang.controller;

import java.util.List;

import com.ho.hwang.dto.Employee.*;
import com.ho.hwang.paging.Page;
import com.ho.hwang.vo.EmployeeVo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.ho.hwang.service.UserService;

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

	// ==================================사원
	@GetMapping("/employee/list")
	public String getEmployeeList(@RequestParam(defaultValue = "1") int page, Model model){

		int listCnt = userService.selectEmployeeTotalCount();
		Page paging = new Page(listCnt, page);
		List<EmployeeVo> employeeList = userService.selectAllEmployee(paging.getStartIndex(), paging.getPageSize());

		model.addAttribute("employeeList", employeeList);
		model.addAttribute("paging", paging);

		return "employee/list";
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
		int result = userService.deleteEmployee(charr);
		return result;
	}

	// 사원 등록 부분
	@PostMapping("/employee/enroll")
	public void enrollEmployee(InsertEmployeeDto insertEmployeeDto) {
		userService.insertEmployee(insertEmployeeDto);
	}

}
