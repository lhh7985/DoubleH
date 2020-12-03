package com.ho.hwang.dto.Activity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
@AllArgsConstructor
public class SelectCustomerActivityDto {
    private String codeName;
    private String activityTitle;
    private String activityRegistrant;
    private Date activityEstimatedDate;
    private String activityContent;
    private Date activityCompletionDate;
    private int activityId;
    private String activityStatus;
    private Date activityRegistrationDate;
}
