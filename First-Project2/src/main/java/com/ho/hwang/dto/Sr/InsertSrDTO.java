package com.ho.hwang.dto.Sr;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
@AllArgsConstructor
public class InsertSrDTO{
    private int customer_id;
    private int product_id;
    private int sr_type;
    private String type;
    private String customer_name;
    private String product_name;

    private String importance;
    private Date sr_requestDate;
    private String sr_title;
    private String sr_content;
    private String sr_registrant;
    private String sr_registrationDate;
}
