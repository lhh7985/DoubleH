package com.ho.hwang.dto.Activity;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;

@Getter
@Setter
@AllArgsConstructor
public class UpdateActivityDto {
    private String activityTitle;
    private String activityContent;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate activityEstimatedDate;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate activityEstimatedCompletionDate;
    private int activityId;
}
