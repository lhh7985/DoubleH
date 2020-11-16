package com.ho.hwang.dto.Sr;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
@AllArgsConstructor
public class SelectSrDTO{
    private int sr_id;
    private String code_name;
    private String product_name;
    private String customer_name;
    private String sr_title;
    private Date sr_requestDate;
    private Date sr_estimatedDate;
    private Date sr_completionDate;
    private String sr_status;
    private String importance;
}
