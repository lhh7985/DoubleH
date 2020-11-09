package com.ho.hwang.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class ActivityVO {
	
	private int activity_id;
	private int sr_id;
	private String code_name;
	private int activity_type;
	private String activity_title;
	private String activity_content;
	private String activity_status;
	
	private Date activity_estimatedDate = null;
	
	private Date activity_completionDate = null;
	
	private String activity_registrant;
	private String activity_registrationDate;
	private String activity_modifier;
	private Date activity_modifiedDate;
	
	
	private String type;
	
	
	
	
}
