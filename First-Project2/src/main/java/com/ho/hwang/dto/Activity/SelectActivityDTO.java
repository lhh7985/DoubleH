package com.ho.hwang.dto.Activity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
@AllArgsConstructor
public class SelectActivityDTO {
    private String code_name;
    private String activity_title;
    private String activity_registrant;
    private Date activity_estimatedDate = null;
    private String activity_content;
    private Date activity_completionDate = null;
    private int activity_id;
}
