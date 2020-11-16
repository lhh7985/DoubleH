package com.ho.hwang.dto.Employee;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class InsertEmployeeDTO{
    private int employee_type;
    private int department_id;
    private String employee_position;
    private String employee_name;
    private String employee_contact;
    private String employee_phone;
    private String employee_email;
    private String type;
    private String dept;
}
