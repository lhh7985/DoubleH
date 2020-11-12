package com.ho.hwang.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;


public class ActivityDTO {
	
	@Getter @Setter
	@AllArgsConstructor
	public static class SelectActivityDTO{
		private String code_name;
		private String activity_title;
		private String activity_registrant;
		private Date activity_estimatedDate = null;
		private String activity_content;
		private Date activity_completionDate = null;
		private int activity_id;
	}
	
	@Getter @Setter
	public static class InsertCustomerActivityDTO{
		private int sr_id;
		private int activity_type;
		private String activity_status;
		private String activity_title;
		private String activity_content;
		private Date activity_estimatedDate = null;
		private Date activity_completionDate = null;
		private String activity_registrationDate;
		private String activity_registrant;
		private String type;
	}
	
	@Getter @Setter
	public static class InsertActivityDTO{
		private int activity_type;
		private String activity_status;
		private String activity_title;
		private String activity_content;
		private Date activity_estimatedDate;
		private Date activity_completionDate;
		private String activity_registrationDate;
		private String activity_registrant;
		private String type;
	}
}
