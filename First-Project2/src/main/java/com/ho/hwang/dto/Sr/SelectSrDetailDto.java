package com.ho.hwang.dto.Sr;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
@AllArgsConstructor
public class SelectSrDetailDTO{
    private String codeName;
    private String productName;
    private String customerName;
    private String srTitle;
    private Date srRequestDate;
    private Date srEstimatedDate;
    private Date srCompletionDate;
    private String srStatus;
    private String importance;
    private String srContent;
    private String srRegistrant;
    private Date srRegistrationDate;
}
