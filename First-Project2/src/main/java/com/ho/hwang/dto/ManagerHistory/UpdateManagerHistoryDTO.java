package com.ho.hwang.dto.ManagerHistory;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class UpdateManagerHistoryDTO {
    private int customer_id;
    private int employee_id;
    private int managerHistory_type;
    private Date managerHistory_startDate;
    private Date managerHistory_endDate;

    public UpdateManagerHistoryDTO(int customer_id, int employee_id) {
        this.customer_id = customer_id;
        this.employee_id = employee_id;
    }

    public UpdateManagerHistoryDTO(int customer_id) {
        this.customer_id = customer_id;
    }
}
