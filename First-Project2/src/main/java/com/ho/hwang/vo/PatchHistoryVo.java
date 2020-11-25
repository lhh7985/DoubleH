package com.ho.hwang.vo;

import java.util.Date;
import lombok.Getter;
import lombok.Setter;

@Getter
public class PatchHistoryVo {
	private int deliveryId;
	private int packageId;
	private String patchTitle;
	private String patchContent;
	private Date patchDate;
	
	private String patchRegistrant;
	private Date patchRegistrationDate;
	private String patchModifier;
	private Date patchModifiedDate;
	
	
	
}

