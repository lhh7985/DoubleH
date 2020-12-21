package com.ho.hwang.dto.Sr;

import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;

@Getter
@Setter
public class InsertSrDto {
    private int customerId;
    private int productId;
    private int srType;

    private String type;
    private String customerName;
    private String productName;

    private String importance;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate srRequestDate;
    private String srTitle;
    private String srContent;
    private String srRegistrant;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate srRegistrationDate;

    public InsertSrDto(String type, String customerName, String productName, String importance, LocalDate srRequestDate, String srTitle, String srContent) {
        this.type = type;
        this.customerName = customerName;
        this.productName = productName;
        this.importance = importance;
        this.srRequestDate = srRequestDate;
        this.srTitle = srTitle;
        this.srContent = srContent;
    }
}


