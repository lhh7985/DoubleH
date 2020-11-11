package com.ho.hwang.vo;

import java.sql.Date;

import lombok.Getter;

@Getter
public class ManagerVO {
	private String customer_name;
	private String code_name;
	private String employee_name;
	private String employee_contact;
	private Date managerHistory_startDate;
	private Date managerHistory_endDate;
}
