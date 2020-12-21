package com.ho.hwang.vo;

import java.time.LocalDate;

import lombok.Builder;
import lombok.Getter;
import org.apache.tomcat.jni.Local;
import org.springframework.format.annotation.DateTimeFormat;

@Getter
public class SrVo {
	private int srId;
	private int customerId;
	private String customerName;
	private int productId;
	private String productName;

	private int srType;
	private String codeName;

	private String importance;


	private String srTitle;
	private String srContent;
	private String srStatus;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate srRequestDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate srEstimatedDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate srCompletionDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate srPatchEstimatedDate;

	private String srRegistrant;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate srRegistrationDate;
	private String srModifier;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate srModifiedDate;
	private String employeeName;

	private String currentUser;

	public SrVo() {
	}

	public SrVo(int srId, String srStatus, String currentUser) {
		this.srId = srId;
		this.srStatus = srStatus;
		this.srCompletionDate = LocalDate.now();
		this.currentUser = currentUser;
	}

	public SrVo(int srId, String srTitle, String srContent, String srModifier) {
		this.srId = srId;
		this.srTitle = srTitle;
		this.srContent = srContent;
		this.srModifier = srModifier;
		this.srModifiedDate = LocalDate.now();
	}

	@Builder(builderClassName = "insertBuilder")
	public SrVo(int customerId, int productId, int srType, String importance, String srTitle, String srContent, LocalDate srRequestDate, String srRegistrant) {
		this( 0,  customerId,  productId,  srType,  importance,  srTitle,  srContent, srRequestDate, null, null, null,srRegistrant, LocalDate.now(), null, null);
	}

	public SrVo(int srId, int customerId, int productId, int srType, String importance, String srTitle, String srContent, LocalDate srRequestDate, LocalDate srEstimatedDate, LocalDate srCompletionDate, LocalDate srPatchEstimatedDate, String srRegistrant, LocalDate srRegistrationDate, String srModifier, LocalDate srModifiedDate) {
		this.srId = srId;
		this.customerId = customerId;
		this.productId = productId;
		this.srType = srType;
		this.importance = importance;
		this.srTitle = srTitle;
		this.srContent = srContent;
		this.srRequestDate = srRequestDate;
		this.srEstimatedDate = srEstimatedDate;
		this.srCompletionDate = srCompletionDate;
		this.srPatchEstimatedDate = srPatchEstimatedDate;
		this.srRegistrant = srRegistrant;
		this.srRegistrationDate = srRegistrationDate;
		this.srModifier = srModifier;
		this.srModifiedDate = srModifiedDate;
	}
}
