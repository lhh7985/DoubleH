package com.ho.hwang.vo;

import java.util.Date;
import lombok.Getter;
import lombok.Setter;

@Getter
public class PatchHistoryVO {
	private int delivery_id;
	private int package_id;
	private String patch_title;
	private String patch_content;
	private Date patch_date;
	
	private String patch_registrant;
	private Date patch_registrationDate;
	private String patch_modifier;
	private Date patch_modifiedDate;
	
	
	
}

