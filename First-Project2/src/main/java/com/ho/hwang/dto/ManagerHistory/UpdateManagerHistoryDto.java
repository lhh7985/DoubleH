package com.ho.hwang.dto.ManagerHistory;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class UpdateManagerHistoryDTO {
    private int customerId;
    private int employeeId;
    private int managerHistoryType;
    private Date managerHistoryStartDate;
    private Date managerHistoryEndDate;

    public UpdateManagerHistoryDTO(int customerId, int employeeId) {
        this.customerId = customerId;
        this.employeeId = employeeId;
    }

    public UpdateManagerHistoryDTO(int customerId) {
        this.customerId = customerId;
    }
}
