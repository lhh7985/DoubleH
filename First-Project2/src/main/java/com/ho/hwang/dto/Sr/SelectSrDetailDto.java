package com.ho.hwang.dto.Sr;

import com.ho.hwang.vo.SrVo;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
@AllArgsConstructor
public class SelectSrDetailDto {
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
    private String srRegistrationDate;
    private int srId;


    public SelectSrDetailDto(SrVo srVo) {
        this.codeName = srVo.getCodeName();
        this.productName = srVo.getProductName();
        this.customerName = srVo.getCustomerName();
        this.srTitle = srVo.getSrTitle();
        this.srRequestDate = srVo.getSrRequestDate();
        this.srEstimatedDate = srVo.getSrEstimatedDate();
        this.srCompletionDate = srVo.getSrCompletionDate();
        this.srStatus = srVo.getSrStatus();
        this.importance = srVo.getImportance();
        this.srContent = srVo.getSrContent();
        this.srRegistrant = srVo.getSrRegistrant();
        this.srRegistrationDate = srVo.getSrRegistrationDate();
        this.srId = srVo.getSrId();
    }
}
