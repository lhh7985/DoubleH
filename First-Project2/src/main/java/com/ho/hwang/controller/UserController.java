package com.ho.hwang.controller;

import com.ho.hwang.dto.Employee.InsertEmployeeDto;
import com.ho.hwang.dto.Employee.UpdateEmployeeDto;
import com.ho.hwang.paging.JqgridResponse;
import com.ho.hwang.service.UserService;
import com.ho.hwang.vo.EmployeeVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

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
		List<String> list = userService.selectEmployee_type();
		List<String> deptName = userService.selectDept_name();
		model.addAttribute("type", list);
		model.addAttribute("dept", deptName);
		return "employee/list";
	}

	@GetMapping("/employee/getlist")
	public @ResponseBody JqgridResponse getAll() {

		List<EmployeeVo> users = userService.selectAllEmployee2();
		JqgridResponse response = new JqgridResponse();
		response.setRows(users);
		return response;
	}


//	@GetMapping("/employee/enroll")
//	public String enrollEmployee(Model model) {
//		List<String> list = userService.selectEmployee_type();
//		List<String> deptName = userService.selectDept_name();
//		model.addAttribute("type", list);
//		model.addAttribute("dept", deptName);
//
//		return "employee/enroll";
//	}

	@PostMapping("/employee/delete")
	@ResponseBody
	public int deleteCode( @RequestParam(value="id") Integer employeeId) throws Exception {
		int result = userService.deleteEmployee(employeeId);
		return result;
	}

	// 사원 등록 부분
	@PostMapping("/employee/enroll")
	public void enrollEmployee(InsertEmployeeDto insertEmployeeDto) {
		userService.insertEmployee(insertEmployeeDto);
	}

	@GetMapping("/test")
	public String test(){
		return "test";
	}

	@PostMapping("/employee/update")
	@ResponseBody
	public int updateEmployee(@RequestParam("departmentName") String departmentName,
							  @RequestParam("employeePosition") String employeePosition,
							  @RequestParam("employeeName") String employeeName,
							  @RequestParam("employeeContact") String employeeContact,
							  @RequestParam("employeePhone") String employeePhone,
							  @RequestParam("employeeEmail") String employeeEmail,
							  @RequestParam("id") int employeeId ){
		UpdateEmployeeDto updateEmployeeDto = UpdateEmployeeDto.builder()
				.employeePhone(employeePhone)
				.employeeEmail(employeeEmail)
				.employeeContact(employeeContact)
				.employeeName(employeeName)
				.departmentName(departmentName)
				.employeeId(employeeId)
				.employeePosition(employeePosition)
				.build();
		int result = userService.updateEmployee(updateEmployeeDto);
		return result;
	}

	@PostMapping("/department")
	@ResponseBody
	public List<String> getDepartmentList(){
		List<String> departmentList = userService.selectDepartment();
		return departmentList;
	}

}
