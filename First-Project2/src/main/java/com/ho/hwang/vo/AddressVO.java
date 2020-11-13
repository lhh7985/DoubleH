package com.ho.hwang.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter

public class AddressVO {
	private int address_id;
	private int customer_id; 
	private int address_type;
	private String address_add;
	
	private String address_registrant;
	private Date address_registrationDate;
	private String address_modifier;
	private Date address_modifiedDate;
	
	
	
	
}
