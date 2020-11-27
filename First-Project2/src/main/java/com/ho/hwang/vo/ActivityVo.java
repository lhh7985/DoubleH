package com.ho.hwang.vo;

import lombok.Builder;
import lombok.Getter;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;

@Getter

public class ActivityVo {

	private int activityType;
	private String activityStatus;
	private String activityTitle;
	private String activityContent;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate activityEstimatedDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate activityCompletionDate;
	private String activityRegistrant;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate activityRegistrationDate;

	private String codeName;
	private int activityId;
	private int srId;
	private String activityModifier;
	private LocalDate activityModifiedDate;

	private String type;

	public ActivityVo() {
	}

	@Builder
	public ActivityVo(int srId,String activityStatus, String activityTitle, String activityContent, LocalDate activityEstimatedDate, String codeName, String type, int activityType, String activityRegistrant) {
		this(activityType, activityStatus, activityTitle, activityContent, activityEstimatedDate, null, activityRegistrant, LocalDate.now(), codeName,0,srId,null,null,type);
	}

	private ActivityVo(int activityType,
					   String activityStatus,
					   String activityTitle,
					   String activityContent,
					   LocalDate activityEstimatedDate,
					   LocalDate activityCompletionDate,
					   String activityRegistrant,
					   LocalDate activityRegistrationDate,
					   String codeName,
					   int activityId,
					   int srId,
					   String activityModifier,
					   LocalDate activityModifiedDate,
					   String type) {


		this.activityType = activityType;
		this.activityStatus = activityStatus;
		this.activityTitle = activityTitle;
		this.activityContent = activityContent;
		this.activityEstimatedDate = activityEstimatedDate;
		this.activityCompletionDate = activityCompletionDate;
		this.activityRegistrant = activityRegistrant;
		this.activityRegistrationDate = activityRegistrationDate;
		this.codeName = codeName;
		this.activityId = activityId;
		this.srId = srId;
		this.activityModifier = activityModifier;
		this.activityModifiedDate = activityModifiedDate;
		this.type = type;
	}
}
