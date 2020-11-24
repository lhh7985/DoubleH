package com.ho.hwang.vo;

import java.util.Date;
import lombok.Getter;
import lombok.Setter;

@Getter
public class OsVO {
	private int osId;
	private int deliveryId;
	private String osName;
	private int osQuantity;
	
	private String osRegistrant;
	private Date osRegistrationDate;
	private String osModifier;
	private Date osModifiedDate;

}
