package com.ho.hwang.vo;

import java.util.Date;
import lombok.Getter;
import lombok.Setter;

@Getter
public class OsVO {
	private int os_id;
	private int delivery_id;
	private String os_name;
	private int os_quantity;
	
	private String os_registrant;
	private Date os_registrationDate;
	private String os_modifier;
	private Date os_modifiedDate;

}
