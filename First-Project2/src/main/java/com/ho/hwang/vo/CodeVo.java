package com.ho.hwang.vo;

import java.time.LocalDate;

import lombok.Builder;
import lombok.Getter;


@Getter
public class CodeVo {
	private int codeId;
	private String codeGroup;
	private String codeUpper;
	private String codeName;
	private String codeStatus;
	
	private String codeRegistrant;
	private LocalDate codeRegistrationDate;
	private String codeModifier;
	private LocalDate codeModifiedDate;

	public CodeVo() {
	}


	@Builder
	public CodeVo(String codeGroup, String codeUpper, String codeName, String codeStatus) {
		this(0,codeGroup,codeUpper, codeName, codeStatus, "", LocalDate.now(), "", LocalDate.now());
	}


	private CodeVo(int codeId,
				   String codeGroup,
				   String codeUpper,
				   String codeName,
				   String codeStatus,
				   String codeRegistrant,
				   LocalDate codeRegistrationDate,
				   String codeModifier,
				   LocalDate codeModifiedDate) {

		//null체크 or 검증 필요

		this.codeId = codeId;
		this.codeGroup = codeGroup;
		this.codeUpper = codeUpper;
		this.codeName = codeName;
		this.codeStatus = codeStatus;
		this.codeRegistrant = codeRegistrant;
		this.codeRegistrationDate = codeRegistrationDate;
		this.codeModifier = codeModifier;
		this.codeModifiedDate = codeModifiedDate;
	}
}
