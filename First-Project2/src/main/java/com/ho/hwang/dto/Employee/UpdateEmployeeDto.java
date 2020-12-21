package com.ho.hwang.dto.Employee;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UpdateEmployeeDto {
    private int departmentId;
    private String departmentName;
    private int employeeId;
    private String employeeName;
    private String employeePosition;
    private String employeeContact;
    private String employeePhone;
    private String employeeEmail;

    public UpdateEmployeeDto() {
    }

    @Builder
    public UpdateEmployeeDto(String departmentName, int employeeId, String employeeName, String employeePosition, String employeeContact, String employeePhone, String employeeEmail) {
        this.departmentName = departmentName;
        this.employeeId = employeeId;
        this.employeeName = employeeName;
        this.employeePosition = employeePosition;
        this.employeeContact = employeeContact;
        this.employeePhone = employeePhone;
        this.employeeEmail = employeeEmail;
    }
}
