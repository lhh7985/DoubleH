package com.ho.hwang.vo;

import java.sql.Date;


import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class DeliveryVO {
	private int delivery_id;
	private int customer_id;
	private int product_id;
	private int delivery_quantity;
	private Date delivery_date;
	private int delivery_businessNum;
	
	private String delivery_registrant;
	private Date delivery_registrationDate;
	private String delivery_modifier;
	private Date delivery_modifiedDate;
	
	private String customer_name;
	private String product_name;
	
	
	private int Window;
	private int Linux;
	private int Unix;
	
	
	
	
	
}
