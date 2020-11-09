package com.ho.hwang.vo;

import java.util.Date;
import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class PackageVO {
	private int package_id;
	private int employee_id_developer;
	private int employee_id_distributor;
	private int product_id;
	
	private String package_name;
	private String package_version;
	private Date package_uploadDate;
	private String package_kernel;
	private String package_os;
	
	private String package_registrant;
	private Date package_registrationDate;
	private String package_modifier;
	private Date package_modifiedDate;
	
	
	
	
	
}
