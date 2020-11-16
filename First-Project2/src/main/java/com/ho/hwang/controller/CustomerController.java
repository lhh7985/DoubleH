package com.ho.hwang.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.ho.hwang.dto.*;
import com.ho.hwang.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.ho.hwang.vo.ManagerVO;
import com.ho.hwang.vo.OsVO;

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
		CustomerDTO.SelectCustomerDetail customerDetail = customerService.selectCustomerDetail(customer_id);
		EmployeeDTO.SelectEmployeeDTO empvo = userService.selectEmployee(customerDetail.getEmployee_ID_Manager());
		EmployeeDTO.SelectEmployeeDTO se = userService.selectEmployee(customerDetail.getEmployee_ID_SE());
		EmployeeDTO.SelectEmployeeDTO sales = userService.selectEmployee(customerDetail.getEmployee_ID_Sales());

		model.addAttribute("customer", customerDetail);
		model.addAttribute("manager", empvo);
		model.addAttribute("se", se);
		model.addAttribute("sales", sales);

		return "customer/detail";
	}

	@GetMapping("/delivery")
	public String getDelivery(Model model, HttpServletRequest req) {
		int customer_id = Integer.parseInt(req.getParameter("customer_id"));
		List<ProductDTO.SelectDeliveryDTO> list = productService.selectDelivery(customer_id);
		model.addAttribute("list", list);
		List<OsVO> list2 = productService.selectOS(customer_id);
		model.addAttribute("list2", list2);

		return "customer/delivery";
	}

	@GetMapping("/manager")
	public String getManagerHistory(Model model, HttpServletRequest req) {
		int customer_id = Integer.parseInt(req.getParameter("customer_id"));
		List<ManagerVO> list = customerService.selectManager(customer_id);
		model.addAttribute("list", list);
		return "customer/manager";
	}

	@GetMapping("/list")
	public String getCustomerList(Model model) {
		List<CustomerDTO.SelectCustomerListDTO> list = customerService.selectCustomerList();
		model.addAttribute("list", list);

		return "customer/list";
	}

	@GetMapping("/sr")
	public String getSrList(Model model, HttpServletRequest req) {
		int customer_id = Integer.parseInt(req.getParameter("customer_id"));
		List<SrDTO.SelectSrListDTO> srList = srService.selectSRList(customer_id);
		model.addAttribute("srList", srList);

		return "customer/sr";
	}

	@GetMapping("/sr-detail")
	public String getSrDetail(Model model, int sr_id) {
		SrDTO.SelectSrDetailDTO selectSrDetailDTO = srService.selectSRDetail(sr_id);
		List<ActivityDTO.SelectCustomerActivityDTO> selectCustomerActivityDTO = activityService.selectCustomerActivity(sr_id);
		model.addAttribute("srvo", selectSrDetailDTO);
		model.addAttribute("acvo", selectCustomerActivityDTO);

		return "customer/sr_detail";
	}

	@GetMapping("/activity")
	public String getCustomerActivity(Model model, HttpServletRequest req) {
		int customer_id = Integer.parseInt(req.getParameter("customer_id"));
		List<ActivityDTO.SelectVisitDTO> list = activityService.selectVisit(customer_id);
		model.addAttribute("list", list);

		return "/customer/activity";
	}

	@GetMapping(value = "/modify")
	public String modifyCustomerDetail() {
		return "/customer/modify";
	}

	@PostMapping(value = "/modify")
	public void modifyCustomerDetail(CustomerDTO.UpdateCustomerDetailDTO updateCustomerDetailDTO) {
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
	public void enrollCustomer(CustomerDTO.InsertCustomerDTO insertCustomerDTO) {
		customerService.insertCustomer(insertCustomerDTO);
	}
}
