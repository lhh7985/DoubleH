package com.ho.hwang.vo;

import java.time.LocalDate;
import java.util.Date;
import lombok.Getter;

@Getter
public class OsVo {
	private int osId;
	private int deliveryId;
	private String osName;
	private int osQuantity;
	
	private String osRegistrant;
	private LocalDate osRegistrationDate;
	private String osModifier;
	private LocalDate osModifiedDate;

	private String productName;
	private LocalDate deliveryDate;

}
