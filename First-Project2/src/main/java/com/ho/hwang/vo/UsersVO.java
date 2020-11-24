package com.ho.hwang.vo;

import java.util.Date;
import lombok.Getter;
import lombok.Setter;

@Getter
public class UsersVO {
	private String userId;
	private String userPw;
	private int employeeId;
	private int enabled;
	private String authority;

	private String userRegistrant;
	private String userRegistrationDate;
	private String userModifier;
	private Date userModifiedDate;
	
	
	
}
