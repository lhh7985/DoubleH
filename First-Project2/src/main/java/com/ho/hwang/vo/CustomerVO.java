package com.ho.hwang.vo;

import java.util.Date;


import lombok.Getter;
import lombok.Setter;

@Getter
public class CustomerVO {
	private int customer_id;
	
	private String customer_name;
	private int employee_id_se;
	private int employee_id_sales;
	private int employee_id_manager;
	
	private String address_address;
	private String address_post;
	private String address_detail;
	
	
	
	
	private String customer_registrant;
	private Date customer_registrationDate;
	private String customer_modifier;
	private Date customer_modifiedDate;
	
	
	
	
	
	
}
