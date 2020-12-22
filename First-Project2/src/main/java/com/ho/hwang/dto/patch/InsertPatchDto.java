package com.ho.hwang.dto.patch;

import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;

@Getter
@Setter
public class InsertPatchDto {
    private int packageId;
    private int deliveryId;
    private String patchTitle;
    private String patchContent;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate patchDate;
    private String patchRegistrant;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate patchRegistrationDate;
    private String patchModifier;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate patchModifiedDate;
}
