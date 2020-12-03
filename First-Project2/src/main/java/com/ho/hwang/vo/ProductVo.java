package com.ho.hwang.vo;

import java.util.Date;
import lombok.Getter;
import lombok.Setter;

@Getter
public class ProductVo {
	private int productId;
	private String productName;
	private String productContent;
	
	private String productRegistrant;
	private Date productRegistrationDate;
	private String productModifier;
	private Date productModifiedDate;
	
	
	
}
