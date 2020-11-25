package com.ho.hwang.dto.ManagerHistory;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
@AllArgsConstructor
public class SelectManagerDTO {
    private String customerName;
    private String codeName;
    private String employeeName;
    private String employeeContact;
    private Date managerHistoryStartDate;
    private Date managerHistoryEndDate;
}
