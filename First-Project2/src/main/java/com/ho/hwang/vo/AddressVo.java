package com.ho.hwang.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter

public class AddressVo {
	private int addressId;
	private int customerId;
	private int addressType;
	private String addressAdd;
	
	private String addressRegistrant;
	private Date addressRegistrationDate;
	private String addressModifier;
	private Date addressModifiedDate;
	
	
	
	
}
