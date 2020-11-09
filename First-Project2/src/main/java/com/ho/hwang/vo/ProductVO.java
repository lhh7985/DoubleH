package com.ho.hwang.vo;

import java.util.Date;
import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class ProductVO {
	private int product_id;
	private String product_name;
	private String product_content;
	
	private String Product_Registrant;
	private Date Product_registrationDate;
	private String Product_Modifier;
	private Date Product_modifiedDate;
	
	
	
}
