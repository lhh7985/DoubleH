package com.ho.hwang.dto.Code;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UpdateCodeDto {
    private int codeId;
    private String codeGroup;
    private String codeUpper;
    private String codeName;
    private String codeStatus;

    public UpdateCodeDto() {
    }

    @Builder
    public UpdateCodeDto(int codeId, String codeGroup, String codeUpper, String codeName, String codeStatus) {
        this.codeId = codeId;
        this.codeGroup = codeGroup;
        this.codeUpper = codeUpper;
        this.codeName = codeName;
        this.codeStatus = codeStatus;
    }
}
