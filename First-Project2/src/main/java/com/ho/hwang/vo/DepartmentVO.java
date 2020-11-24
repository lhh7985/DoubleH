package com.ho.hwang.vo;

import java.util.Date;


import lombok.Getter;
import lombok.Setter;

@Getter
public class DepartmentVO {
	private int departmentId;
	private String departmentName;
	private int departmentHeadId;
	private int departmentUpper;
	private String departmentLocation;
	
	private String departmentRegistrant;
	private Date departmentRegistrationDate;
	private String departmentModifier;
	private Date departmentModifiedDate;
	
	
	
	
	
}
