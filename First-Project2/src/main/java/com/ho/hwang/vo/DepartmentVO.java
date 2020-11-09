package com.ho.hwang.vo;

import java.util.Date;


import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class DepartmentVO {
	private int department_id;
	private String department_name;
	private int department_headId;
	private int department_upper;
	private String department_location;
	
	private String department_registrant;
	private Date department_registrationDate;
	private String department_modifier;
	private Date department_modifiedDate;
	
	
	
	
	
}
