package com.ho.hwang.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

public class CustomerDTO {

	@Getter @Setter
	public static class UpdateCustomerDetailDTO{
		private int Employee_id_manager;
		private int Employee_id_se;
		private int Employee_id_sales;
		private int customer_id;
		private int ManagerHistory_type;
		//주소 변경 미적용
		private String address_address;
		private String address_post;
		private String address_detail;
	}

	@Getter
	@Setter
	public static class InsertCustomerDTO{
		private int customer_id;
		private String customer_name;
		private int employee_id_sales;
		private int employee_id_se;
		private int employee_id_manager;
		private String address_address;
		private String address_post;
		private String address_detail;
	}


	@Getter
	@Setter
	@AllArgsConstructor
	public static class SelectCustomerDetail{
		private String customer_name;
		private String address_address;
		private int address_post;
		private String address_detail;
		private int Employee_ID_Sales;
		private int Employee_ID_SE;
		private int Employee_ID_Manager;
		private int customer_id;
	}


	@Getter
	@Setter
	@AllArgsConstructor
	public static class SelectCustomerListDTO{
		private int customer_id;
		private String customer_name;
		private String address_address;
		private String address_detail;
		private String manager;
		private String se;
		private String sales;
	}

}
