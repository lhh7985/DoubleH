package com.ho.hwang.dto.Employee;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class InsertEmployeeDto {
    private int employeeType;
    private int departmentId;
    private String employeePosition;
    private String employeeName;
    private String employeeContact;
    private String employeePhone;
    private String employeeEmail;
    private String type;
    private String dept;
}
