package com.ho.hwang.dto;

import java.security.Principal;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;


public class ActivityDTO {
	
	@Getter
	@Setter
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

	@Getter
	@Setter
	@AllArgsConstructor
	public static class SelectCustomerActivityDTO{
		private String code_name;
		private String activity_title;
		private String activity_registrant;
		private Date activity_estimatedDate;
		private String activity_content;
		private Date activity_completionDate;
		private int activity_id;
		private String activity_status;
		private Date activity_registrationDate;
	}
	
	@Getter
	@Setter
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
	
	@Getter
	@Setter
	public static class InsertActivityDTO{
		private Principal principal;
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

	@Getter
	@Setter
	@AllArgsConstructor
	public static class SelectVisitDTO{
		private String code_Name;
		private int activity_type;
		private String activity_title;
		private Date activity_estimatedDate;
		private Date activity_completionDate;
		private String activity_status;
	}
}
