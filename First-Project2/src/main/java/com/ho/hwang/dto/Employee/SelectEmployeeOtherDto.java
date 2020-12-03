package com.ho.hwang.dto.Employee;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class SelectEmployeeOtherDto {
    private String codeName;
    private String departmentName;
    private String employeeName;
    private String employeeContact;
    private String employeePhone;
    private String employeeEmail;
    private int employeeId;
}
