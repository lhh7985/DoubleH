package com.ho.hwang.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

public class EmployeeDTO {

	@Getter
	@Setter
	@AllArgsConstructor
	public static class SelectEmployeeSecuveDTO {
		private String department_name;
		private String employee_position;
		private String employee_name;
		private String employee_contact;
		private String employee_phone;
		private String employee_email;
		private int employee_type;
		private int employee_id;
	}

	@Getter
	@Setter
	@AllArgsConstructor
	public static class SelectEmployeeOtherDTO {
		private String code_name;
		private String department_name;
		private String Employee_Name;
		private String employee_contact;
		private String employee_phone;
		private String employee_email;
		private int employee_id;
	}

	@Getter @Setter
	public static class InsertEmployeeDTO{
	private int employee_type;
	private int department_id;
	private String employee_position;
	private String employee_name;
	private String employee_contact;
	private String employee_phone;
	private String employee_email;
	private String type;
	private String dept;
	}

	@Getter
	@Setter
	@AllArgsConstructor
	public static class SelectEmployeeDTO{
		private int employee_id;
		private String employee_name;
		private int employee_type;
		private int department_type;
		private String employee_contact;
		private String employee_phone;
		private String employee_email;
		private String employee_position;
	}
}
