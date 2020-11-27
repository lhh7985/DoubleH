package com.ho.hwang.dto.Activity;

import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.security.Principal;
import java.time.LocalDate;

@Getter
@Setter
public class InsertActivityDto {
    private Principal principal;
    private int activityType;
    private String activityStatus;
    private String activityTitle;
    private String activityContent;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate activityEstimatedDate;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate activityCompletionDate;
    private String activityRegistrationDate;
    private String activityRegistrant;
    private String type;
}
