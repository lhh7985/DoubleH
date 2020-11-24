package com.ho.hwang.vo;

import java.sql.Date;

import lombok.Getter;

@Getter
public class ManagerVO {
	private String customerName;
	private String codeName;
	private String employeeName;
	private String employeeContact;
	private Date managerHistoryStartDate;
	private Date managerHistoryEndDate;
}
