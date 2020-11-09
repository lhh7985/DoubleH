package com.ho.hwang.vo;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class SrVO {
	private int sr_id;
	private int customer_id;
	private String customer_name;
	private int product_id;
	private String product_name;
	
	private int sr_type;
	private String code_name;
	
	private String importance;


	private String sr_title;
	private String sr_content;
	private String sr_status;
	private Date sr_requestDate;
	private Date sr_estimatedDate;
	private Date sr_completionDate;
	private Date sr_patchEstimatedDate;
	
	private String sr_registrant;
	private String sr_registrationDate;
	private String sr_modifier;
	private Date sr_modifiedDate;
	
	
	
}
