package com.ho.hwang.dto.Employee;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class SelectEmployeeOtherDTO {
    private String code_name;
    private String department_name;
    private String Employee_Name;
    private String employee_contact;
    private String employee_phone;
    private String employee_email;
    private int employee_id;
}
