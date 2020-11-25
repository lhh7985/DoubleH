package com.ho.hwang.dto.Sr;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
public class InsertSrDTO{
    private int customerId;
    private int productId;
    private int srType;

    private String type;
    private String customerName;
    private String productName;

    private String importance;
    private Date srRequestDate;
    private String srTitle;
    private String srContent;
    private String srRegistrant;
    private String srRegistrationDate;

    public InsertSrDTO(String type, String customerName, String productName, String importance, Date srRequestDate, String srTitle, String srContent) {
        this.type = type;
        this.customerName = customerName;
        this.productName = productName;
        this.importance = importance;
        this.srRequestDate = srRequestDate;
        this.srTitle = srTitle;
        this.srContent = srContent;
    }
}


