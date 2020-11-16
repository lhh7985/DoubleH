package com.ho.hwang.vo;

import java.util.Date;
import lombok.Getter;
import lombok.Setter;

@Getter
public class UsersVO {
	private String user_id;
	private String user_pw;
	private int employee_id;
	private int enabled;
	private String authority;
	
	private String user_registrant;
	private String user_registrationDate;
	private String user_modifier;
	private Date user_modifiedDate;
	
	
	
}
