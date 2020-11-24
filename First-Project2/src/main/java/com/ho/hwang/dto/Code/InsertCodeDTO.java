package com.ho.hwang.dto.Code;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class InsertCodeDTO {
    private int codeId;
    private String codeGroup;
    private String codeUpper;
    private String codeName;
    private String codeStatus;
}