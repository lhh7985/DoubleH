package com.ho.hwang.vo;

import java.sql.Date;
import lombok.Getter;

@Getter
public class ActivityVO {
	
	private String codeName;
	private String activityTitle;
	private int activityId;
	private int srId;
	private int activityType;
	private String activityContent;
	private String activityStatus;
	
	private Date activityEstimatedDate = null;
	private Date activityCompletionDate = null;
	
	private String activityRegistrant;
	private String activityRegistrationDate;
	private String activityModifier;
	private Date activityModifiedDate;
	
	
	private String type;
}
