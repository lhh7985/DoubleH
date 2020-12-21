package com.ho.hwang.dto.patch;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;

@Getter
@Setter
public class InsertPatchDto {
    private int packageId;
    private int deliveryId;
    private String patchTitle;
    private String patchContent;
    private LocalDate patchDate;
    private String patchRegistrant;
    private LocalDate patchRegistrationDate;
    private String patchModifier;
    private LocalDate patchModifiedDate;
}
