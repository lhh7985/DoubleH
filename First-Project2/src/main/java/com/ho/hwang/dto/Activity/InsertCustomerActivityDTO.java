package com.ho.hwang.dto.Activity;

import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
public class InsertCustomerActivityDTO {
    private int sr_id;
    private int activity_type;
    private String activity_status;
    private String activity_title;
    private String activity_content;
    private Date activity_estimatedDate = null;
    private Date activity_completionDate = null;
    private String activity_registrationDate;
    private String activity_registrant;
    private String type;
}
