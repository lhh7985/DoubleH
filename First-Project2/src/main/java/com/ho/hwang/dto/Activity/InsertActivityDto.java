package com.ho.hwang.dto.Activity;

import lombok.Getter;
import lombok.Setter;

import java.security.Principal;
import java.sql.Date;

@Getter
@Setter
public class InsertActivityDto {
    private Principal principal;
    private int activityType;
    private String activityStatus;
    private String activityTitle;
    private String activityContent;
    private Date activityEstimatedDate;
    private Date activityCompletionDate;
    private String activityRegistrationDate;
    private String activityRegistrant;
    private String type;
}
