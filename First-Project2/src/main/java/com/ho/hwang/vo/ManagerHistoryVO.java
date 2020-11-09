package com.ho.hwang.vo;

import java.util.Date;
import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class ManagerHistoryVO {
	private int customer_id;
	private int employee_id;
	private int managerHistory_type;
	private Date managerHistory_startDate;
	private Date managerHisttory_endDate;
	
	private String managerHisttory_registrant;
	private Date managerHisttory_registrationDate;
	private String managerHisttory_modifier;
	private Date managerHisttory_modifiedDate;
	
	
	
	
	
	
	
	
}


