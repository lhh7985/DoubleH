package com.ho.hwang.dto.Employee;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class SelectEmployeeSecuveDTO {
    private String department_name;
    private String employee_position;
    private String employee_name;
    private String employee_contact;
    private String employee_phone;
    private String employee_email;
    private int employee_type;
    private int employee_id;
}
