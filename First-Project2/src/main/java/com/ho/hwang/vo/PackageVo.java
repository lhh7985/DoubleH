package com.ho.hwang.vo;

import java.util.Date;
import lombok.Getter;
import lombok.Setter;

@Getter
public class PackageVo {
	private int packageId;
	private int employeeIdDeveloper;
	private int employeeIdDistributor;
	private int productId;
	
	private String packageName;
	private String packageVersion;
	private Date packageUploadDate;
	private String packageKernel;
	private String packageOs;
	
	private String packageRegistrant;
	private Date packageRegistrationDate;
	private String packageModifier;
	private Date packageModifiedDate;
	
	
	
	
	
}
