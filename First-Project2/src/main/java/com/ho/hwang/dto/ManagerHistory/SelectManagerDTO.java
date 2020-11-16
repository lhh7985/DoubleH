package com.ho.hwang.dto.ManagerHistory;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
@AllArgsConstructor
public class SelectManagerDTO {
    private String customer_name;
    private String code_name;
    private String employee_name;
    private String employee_contact;
    private Date managerHistory_startDate;
    private Date managerHistory_endDate;
}
