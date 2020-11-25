package com.ho.hwang.vo;

import java.sql.Date;


import lombok.Getter;
import lombok.Setter;

@Getter
public class DeliveryVo {
	private int deliveryId;
	private int customerId;
	private int productId;
	private int deliveryQuantity;
	private Date deliveryDate;
	private int deliveryBusinessNum;
	
	private String deliveryRegistrant;
	private Date deliveryRegistrationDate;
	private String deliveryModifier;
	private Date deliveryModifiedDate;
	
	private String customerName;
	private String productName;
	
	
	private int Window;
	private int Linux;
	private int Unix;
	
	
	
	
	
}
