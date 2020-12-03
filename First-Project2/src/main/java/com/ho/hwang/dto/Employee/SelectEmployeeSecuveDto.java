package com.ho.hwang.dto.Employee;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class SelectEmployeeSecuveDto {
    private String departmentName;
    private String employeePosition;
    private String employeeName;
    private String employeeContact;
    private String employeePhone;
    private String employeeEmail;
    private int employeeType;
    private int employeeId;
}
