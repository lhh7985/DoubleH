package com.ho.hwang.dto.Code;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
@AllArgsConstructor
public class CodeDTO {
    private int code_id;
    private String code_group;
    private String code_upper;
    private String code_name;
    private String code_status;
    private String code_registrant;
    private Date code_registrationDate;
    private String code_modifier;
    private Date code_modifiedDate;
}
