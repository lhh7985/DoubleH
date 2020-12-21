package com.ho.hwang.dto.Sr;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UpdateSrDetailDto {
    private int srId;
    private String srTitle;
    private String srContent;

    public UpdateSrDetailDto(int srId, String srTitle, String srContent) {
        this.srId = srId;
        this.srTitle = srTitle;
        this.srContent = srContent;
    }
}
