package com.ho.hwang.dto.Activity;

import com.ho.hwang.vo.ActivityVo;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;
import java.time.LocalDate;

@Getter
@Setter
@AllArgsConstructor
public class SelectActivityDto {
    private String codeName;
    private String activityTitle;
    private String activityContent;
    private String activityRegistrant;
    private LocalDate activityEstimatedDate = null;
    private LocalDate activityCompletionDate = null;
    private int activityId;
    private String activityStatus;
    private LocalDate activityEstimatedCompletionDate;

    public SelectActivityDto() {
    }

    public SelectActivityDto(String codeName, String activityTitle, String activityRegistrant, LocalDate activityEstimatedDate, String activityContent, LocalDate activityCompletionDate, int activityId) {
        this.codeName = codeName;
        this.activityTitle = activityTitle;
        this.activityRegistrant = activityRegistrant;
        this.activityEstimatedDate = activityEstimatedDate;
        this.activityContent = activityContent;
        this.activityCompletionDate = activityCompletionDate;
        this.activityId = activityId;
    }

    public SelectActivityDto(ActivityVo activityVo) {
        this.codeName = activityVo.getCodeName();
        this.activityTitle = activityVo.getActivityTitle();
        this.activityContent = activityVo.getActivityContent();
        this.activityRegistrant = activityVo.getActivityRegistrant();
        this.activityEstimatedDate = activityVo.getActivityEstimatedDate();
        this.activityCompletionDate = activityVo.getActivityCompletionDate();
        this.activityId = activityVo.getActivityId();
        this.activityStatus = activityVo.getActivityStatus();
        this.activityEstimatedCompletionDate = activityVo.getActivityEstimatedCompletionDate();
    }
}
