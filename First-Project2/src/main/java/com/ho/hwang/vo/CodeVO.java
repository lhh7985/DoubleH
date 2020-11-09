package com.ho.hwang.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class CodeVO {
	private int code_id;
	private String code_group;
	private String code_upper;
	private String code_name;
	private String code_status;
	
	private String code_registrant;
	private String code_registrationDate;
	private String code_modifier;
	private Date code_modifiedDate;
}
