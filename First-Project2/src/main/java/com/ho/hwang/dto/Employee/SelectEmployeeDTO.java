package com.ho.hwang.dto.Employee;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class SelectEmployeeDTO{
    private int employee_id;
    private String employee_name;
    private int employee_type;
    private int department_type;
    private String employee_contact;
    private String employee_phone;
    private String employee_email;
    private String employee_position;
}