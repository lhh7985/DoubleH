package com.ho.hwang.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ho.hwang.service.ActivityService;
import com.ho.hwang.service.CustomerService;
import com.ho.hwang.service.SrService;
import com.ho.hwang.service.UserService;
import com.ho.hwang.vo.ActivityVO;
import com.ho.hwang.vo.CustomerListVO;
import com.ho.hwang.vo.CustomerVO;
import com.ho.hwang.vo.DeliveryVO;
import com.ho.hwang.vo.EmployeeVO;
import com.ho.hwang.vo.OsVO;
import com.ho.hwang.vo.SrVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/customer/*")
public class CustomerController {

	private final UserService userService;
	private final CustomerService customerService;
	private final SrService srService;
	private final ActivityService actService;

	@GetMapping("/info")
	public String thymeleaf(int customer_id, Model model) {
		CustomerVO vo = customerService.selectCustomerDetail(customer_id);
		EmployeeVO empvo = userService.selectEmployee(vo.getEmployee_id_manager());
		EmployeeVO se = userService.selectEmployee(vo.getEmployee_id_se());
		EmployeeVO sales = userService.selectEmployee(vo.getEmployee_id_sales());

		model.addAttribute("customer", vo);
		model.addAttribute("manager", empvo);
		model.addAttribute("se", se);
		model.addAttribute("sales", sales);

		return "customer/info";
	}

	@GetMapping("/OS")
	public String OS(Model model, HttpServletRequest req) {
		int customer_id = Integer.parseInt(req.getParameter("customer_id"));
		List<DeliveryVO> list = userService.selectDelivery(customer_id);
		model.addAttribute("list", list);
		List<OsVO> list2 = userService.selectOS(customer_id);
		model.addAttribute("list2", list2);

		return "customer/OS";
	}

	@GetMapping("/manager")
	public String manager(Model model) {
		return "customer/manager";
	}

	@GetMapping("/list")
	public String tab1(Model model) {
		List<CustomerListVO> list = customerService.selectCustomerList();
		model.addAttribute("list", list);

		return "customer/list";
	}

	@GetMapping("/sr")
	public String customer_sr(Model model, HttpServletRequest req) {
		int customer_id = Integer.parseInt(req.getParameter("customer_id"));
		List<SrVO> srList = srService.selectSRList(customer_id);
		model.addAttribute("srList", srList);

		return "customer/sr";
	}

	@GetMapping("/sr-detail")
	public String sr_detail(Model model, int sr_id) {
		SrVO srvo = srService.selectSRDetail(sr_id);
		List<ActivityVO> acvo = actService.selectCustomerActivity(sr_id);
		model.addAttribute("srvo", srvo);
		model.addAttribute("acvo", acvo);

		return "customer/sr_detail";
	}

	@GetMapping("/activity")
	public String customer_activity(Model model, HttpServletRequest req) {
		int customer_id = Integer.parseInt(req.getParameter("customer_id"));
		List<ActivityVO> list = actService.selectVisit(customer_id);
		model.addAttribute("list", list);

		return "/customer/activity";
	}

	@PostMapping(value = "/modify")
	public String customer_modify() {
		return "/modify";
	}

	@PostMapping(value = "/modify.do")
	public void modify(CustomerVO customerVO) {
		if (customerVO.getEmployee_id_manager() != 0) {
			// 오늘날짜 현재 담당자 endDate에 찍기
			// 현재 고객사ID를 통해서 UPDATE 실행
			System.out.println("고객담당자 변경");
			// 새로운 담당자를 오늘 날짜로 Start에 추가하기
		}
		if (customerVO.getEmployee_id_se() != 0) {
			// 오늘날짜 현재 담당자 endDate에 찍기
			// 새로운 담당자를 오늘 날짜로 Start에 추가하기
			System.out.println("SE담당자 변경");
		}

		if (customerVO.getEmployee_id_sales() != 0) {
			// 오늘날짜 현재 담당자 endDate에 찍기
			// 새로운 담당자를 오늘 날짜로 Start에 추가하기
			System.out.println("영업담당자 변경");
		}
	}

	@PostMapping("/delete")
	@ResponseBody
	public int deleteCustomer(@RequestParam(value = "chbox[]") List<Integer> charr) throws Exception {
		int result = 0;
		if (charr != null) {
			for (int i : charr) {
				userService.deleteCustomer(i);
			}
			result = 1;
		}
		return result;
	}

	@GetMapping("/enroll")
	public String custoemr_enroll(Model model) {
		return "/customer/enroll";
	}

	// 고객사 등록부분
	@PostMapping("/enroll")
	public void customer_enroll(CustomerVO customerVO) {
		customerService.insertCustomer(customerVO);
		int x = customerService.selectCustomer_id();
		customerVO.setCustomer_id(x);
		userService.insertAddress(customerVO);
	}
}
