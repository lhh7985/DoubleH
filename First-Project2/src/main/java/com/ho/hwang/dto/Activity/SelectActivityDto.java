package com.ho.hwang.dto.Activity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
@AllArgsConstructor
public class SelectActivityDto {
    private String codeName;
    private String activityTitle;
    private String activityRegistrant;
    private Date activityEstimatedDate = null;
    private String activityContent;
    private Date activityCompletionDate = null;
    private int activityId;
}
