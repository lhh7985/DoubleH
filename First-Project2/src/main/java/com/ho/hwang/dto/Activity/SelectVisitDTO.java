package com.ho.hwang.dto.Activity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
@AllArgsConstructor
public class SelectVisitDTO {

    private String code_Name;
    private int activity_type;
    private String activity_title;
    private Date activity_estimatedDate;
    private Date activity_completionDate;
    private String activity_status;
}
