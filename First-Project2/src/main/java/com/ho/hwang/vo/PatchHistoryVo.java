package com.ho.hwang.vo;

import java.time.LocalDate;
import java.util.Date;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
public class PatchHistoryVo {
	private int patchId;
	private int deliveryId;
	private int packageId;
	private String patchTitle;
	private String patchContent;
	private LocalDate patchDate;
	
	private String patchRegistrant;
	private LocalDate patchRegistrationDate;
	private String patchModifier;
	private LocalDate patchModifiedDate;

	private String customerName;
	private String productName;

	public PatchHistoryVo(){

	}

	@Builder
	public PatchHistoryVo(int deliveryId, int packageId, String patchTitle, String patchContent, LocalDate patchDate, String patchRegistrant) {
		this(0,deliveryId,packageId,patchTitle,patchContent,patchDate,patchRegistrant, LocalDate.now(), null, null);
	}

	private PatchHistoryVo(int patchId, int deliveryId, int packageId, String patchTitle, String patchContent, LocalDate patchDate, String patchRegistrant, LocalDate patchRegistrationDate, String patchModifier, LocalDate patchModifiedDate) {
		this.patchId = patchId;
		this.deliveryId = deliveryId;
		this.packageId = packageId;
		this.patchTitle = patchTitle;
		this.patchContent = patchContent;
		this.patchDate = patchDate;
		this.patchRegistrant = patchRegistrant;
		this.patchRegistrationDate = patchRegistrationDate;
		this.patchModifier = patchModifier;
		this.patchModifiedDate = patchModifiedDate;
	}
}

