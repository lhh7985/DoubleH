package com.ho.hwang.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.ho.hwang.dto.Activity.SelectCustomerActivityDTO;
import com.ho.hwang.dto.Activity.SelectVisitDTO;
import com.ho.hwang.dto.Customer.*;
import com.ho.hwang.dto.Employee.SelectEmployeeDTO;
import com.ho.hwang.dto.ManagerHistory.SelectManagerDTO;
import com.ho.hwang.dto.Product.SelectDeliveryDTO;
import com.ho.hwang.dto.Product.SelectTotalOsDTO;
import com.ho.hwang.dto.Sr.SelectSrDetailDTO;
import com.ho.hwang.dto.Sr.SelectSrListDTO;
import com.ho.hwang.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.ho.hwang.vo.ManagerVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/customer/*")
public class CustomerController {

	private final UserService userService;
	private final CustomerService customerService;
	private final SrService srService;
	private final ActivityService activityService;
	private final ProductService productService;

	@GetMapping("/detail")
	public String getDetail(int customer_id, Model model) {
		SelectCustomerDetailDTO customerDetail = customerService.selectCustomerDetail(customer_id);
		SelectEmployeeDTO empvo = userService.selectEmployee(customerDetail.getEmployee_ID_Manager());
		SelectEmployeeDTO se = userService.selectEmployee(customerDetail.getEmployee_ID_SE());
		SelectEmployeeDTO sales = userService.selectEmployee(customerDetail.getEmployee_ID_Sales());

		model.addAttribute("customer", customerDetail);
		model.addAttribute("manager", empvo);
		model.addAttribute("se", se);
		model.addAttribute("sales", sales);

		return "customer/detail";
	}

	@GetMapping("/delivery")
	public String getDelivery(Model model, HttpServletRequest req) {
		int customer_id = Integer.parseInt(req.getParameter("customer_id"));
		List<SelectDeliveryDTO> list = productService.selectDelivery(customer_id);
		model.addAttribute("list", list);
		List<SelectTotalOsDTO> list2 = productService.selectOS(customer_id);
		model.addAttribute("list2", list2);

		return "customer/delivery";
	}

	@GetMapping("/manager")
	public String getManagerHistory(Model model, HttpServletRequest req) {
		int customer_id = Integer.parseInt(req.getParameter("customer_id"));
		List<SelectManagerDTO> list = customerService.selectManager(customer_id);
		model.addAttribute("list", list);
		return "customer/manager";
	}

	@GetMapping("/list")
	public String getCustomerList(Model model) {
		List<SelectCustomerListDTO> list = customerService.selectCustomerList();
		model.addAttribute("list", list);

		return "customer/list";
	}

	@GetMapping("/sr")
	public String getSrList(Model model, HttpServletRequest req) {
		int customer_id = Integer.parseInt(req.getParameter("customer_id"));
		List<SelectSrListDTO> srList = srService.selectSRList(customer_id);
		model.addAttribute("srList", srList);

		return "customer/sr";
	}

	@GetMapping("/sr-detail")
	public String getSrDetail(Model model, int sr_id) {
		SelectSrDetailDTO selectSrDetailDTO = srService.selectSRDetail(sr_id);
		List<SelectCustomerActivityDTO> selectCustomerActivityDTO = activityService.selectCustomerActivity(sr_id);
		model.addAttribute("srvo", selectSrDetailDTO);
		model.addAttribute("acvo", selectCustomerActivityDTO);

		return "customer/sr_detail";
	}

	@GetMapping("/activity")
	public String getCustomerActivity(Model model, HttpServletRequest req) {
		int customer_id = Integer.parseInt(req.getParameter("customer_id"));
		List<SelectVisitDTO> list = activityService.selectVisit(customer_id);
		model.addAttribute("list", list);

		return "/customer/activity";
	}

	@GetMapping(value = "/modify")
	public String modifyCustomerDetail() {
		return "/customer/modify";
	}

	@PostMapping(value = "/modify")
	public void modifyCustomerDetail(UpdateCustomerDetailDTO updateCustomerDetailDTO) {
		customerService.updateCustomerDetail(updateCustomerDetailDTO);
	}

	@PostMapping("/delete")
	@ResponseBody
	public int deleteCustomer(@RequestParam(value = "chbox[]") List<Integer> charr) throws Exception {
		int result = customerService.deleteCustomer(charr);
		return result;
	}

	@GetMapping("/enroll")
	public String enrollCustomer(Model model) {
		return "/customer/enroll";
	}

	// 고객사 등록부분
	@PostMapping("/enroll")
	public void enrollCustomer(InsertCustomerDTO insertCustomerDTO) {
		customerService.insertCustomer(insertCustomerDTO);
	}
}
