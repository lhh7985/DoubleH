package com.ho.hwang.dto.Activity;

import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;

@Getter
@Setter
public class InsertCustomerActivityDto {
    private int srId;
    private int activityType;
    private String activityStatus;
    private String activityTitle;
    private String activityContent;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate activityEstimatedDate;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate activityCompletionDate;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate activityRegistrationDate;
    private String activityRegistrant;
    private String type;
}
