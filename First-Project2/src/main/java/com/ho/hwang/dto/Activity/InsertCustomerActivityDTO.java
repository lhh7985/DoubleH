package com.ho.hwang.dto.Activity;

import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
public class InsertCustomerActivityDTO {
    private int srId;
    private int activityType;
    private String activityStatus;
    private String activityTitle;
    private String activityContent;
    private Date activityEstimatedDate = null;
    private Date activityCompletionDate = null;
    private String activityRegistrationDate;
    private String activityRegistrant;
    private String type;
}
