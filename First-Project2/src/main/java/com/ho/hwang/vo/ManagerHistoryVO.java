package com.ho.hwang.vo;

import java.util.Date;
import lombok.Getter;
import lombok.Setter;

@Getter
public class ManagerHistoryVO {
	private int customer_id;
	private int employee_id;
	private int managerHistory_type;
	private Date managerHistory_startDate;
	private Date managerHistory_endDate;
	
	private String managerHistory_registrant;
	private Date managerHistory_registrationDate;
	private String managerHistory_modifier;
	private Date managerHistory_modifiedDate;
	
	
	

	
	
	
	
	
	
}


