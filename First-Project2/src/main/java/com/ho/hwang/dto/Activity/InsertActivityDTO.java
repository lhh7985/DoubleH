package com.ho.hwang.dto.Activity;

import lombok.Getter;
import lombok.Setter;

import java.security.Principal;
import java.sql.Date;

@Getter
@Setter
public class InsertActivityDTO {
    private Principal principal;
    private int activity_type;
    private String activity_status;
    private String activity_title;
    private String activity_content;
    private Date activity_estimatedDate;
    private Date activity_completionDate;
    private String activity_registrationDate;
    private String activity_registrant;
    private String type;
}
