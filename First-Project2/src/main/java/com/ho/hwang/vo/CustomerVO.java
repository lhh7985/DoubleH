package com.ho.hwang.vo;

import java.util.Date;


import lombok.Getter;
import lombok.Setter;

@Getter
public class CustomerVO {
	private int customerId;
	private String customerName;
	private int employeeIdSe;
	private int employeeIdSales;
	private int employeeIdManager;
	
	private String addressAddress;
	private String addressPost;
	private String addressDetail;

	private String customerRegistrant;
	private Date customerRegistrationDate;
	private String customerModifier;
	private Date customerModifiedDate;
}
