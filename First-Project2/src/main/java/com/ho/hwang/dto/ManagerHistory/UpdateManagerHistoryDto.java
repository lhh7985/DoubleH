package com.ho.hwang.dto.ManagerHistory;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class UpdateManagerHistoryDto {
    private int customerId;
    private int employeeId;
    private int managerHistoryType;
    private Date managerHistoryStartDate;
    private Date managerHistoryEndDate;

    public UpdateManagerHistoryDto(int customerId, int employeeId) {
        this.customerId = customerId;
        this.employeeId = employeeId;
    }

    public UpdateManagerHistoryDto(int customerId) {
        this.customerId = customerId;
    }
}
