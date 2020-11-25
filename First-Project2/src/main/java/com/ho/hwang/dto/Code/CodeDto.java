package com.ho.hwang.dto.Code;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
@AllArgsConstructor
public class CodeDTO {
    private int codeId;
    private String codeGroup;
    private String codeUpper;
    private String codeName;
    private String codeStatus;
    private String codeRegistrant;
    private Date codeRegistrationDate;
    private String codeModifier;
    private Date codeModifiedDate;


}