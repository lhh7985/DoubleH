package com.ho.hwang.dto.Employee;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class SelectEmployeeDto {
    private int employeeId;
    private String employeeName;
    private int employeeType;
    private int departmentType;
    private String employeeContact;
    private String employeePhone;
    private String employeeEmail;
    private String employeePosition;
}