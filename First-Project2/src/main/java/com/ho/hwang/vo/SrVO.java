package com.ho.hwang.vo;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
public class SrVO {
	private int srId;
	private int customerId;
	private String customerName;
	private int productId;
	private String productName;
	
	private int srType;
	private String codeName;
	
	private String importance;


	private String srTitle;
	private String srContent;
	private String srStatus;
	private Date srRequestDate;
	private Date srEstimatedDate;
	private Date srCompletionDate;
	private Date srPatchEstimatedDate;
	
	private String srRegistrant;
	private String srRegistrationDate;
	private String srModifier;
	private Date srModifiedDate;
	
	
	
}
