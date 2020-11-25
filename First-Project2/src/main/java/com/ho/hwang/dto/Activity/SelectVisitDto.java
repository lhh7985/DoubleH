package com.ho.hwang.dto.Activity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
@AllArgsConstructor
public class SelectVisitDTO {

    private String codeName;
    private int activityType;
    private String activityTitle;
    private Date activityEstimatedDate;
    private Date activityCompletionDate;
    private String activityStatus;
}
