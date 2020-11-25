package com.ho.hwang.dto.Activity;

import lombok.Getter;
import lombok.Setter;

import java.sql.Date;
import java.time.LocalDate;

@Getter
@Setter
public class InsertCustomerActivityDto {
    private int srId;
    private int activityType;
    private String activityStatus;
    private String activityTitle;
    private String activityContent;
    private Date activityEstimatedDate = null;
    private Date activityCompletionDate = null;
    private Date activityRegistrationDate;
    private String activityRegistrant;
    private String type;
}
