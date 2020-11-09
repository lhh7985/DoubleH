package com.ho.hwang.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
public class CustomerController {

	private final UserService userService;

	@RequestMapping(value = "/info")
	public String thymeleaf(int customer_id, Model model) {
		CustomerVO vo = userService.selectCustomerDetail(customer_id);
		EmployeeVO empvo = userService.selectEmployee(vo.getEmployee_id_manager());

		EmployeeVO se = userService.selectEmployee(vo.getEmployee_id_se());
		EmployeeVO sales = userService.selectEmployee(vo.getEmployee_id_sales());

		model.addAttribute("customer", vo);
		model.addAttribute("manager", empvo);
		model.addAttribute("se", se);
		model.addAttribute("sales", sales);

		return "info";
	}

	@RequestMapping("/OS")
	@ResponseBody
	public ModelAndView OS(Model model, HttpServletRequest req) {

		int customer_id = Integer.parseInt(req.getParameter("customer_id"));
		ModelAndView mav = new ModelAndView();

		List<DeliveryVO> list = userService.selectDelivery(customer_id);
		mav.addObject("list", list);

		List<OsVO> list2 = userService.selectOS(customer_id);
		mav.addObject("list2", list2);

		return mav;
	}

	@RequestMapping("/manager")
	public String manager(Model model) {
		return "manager";
	}

	@RequestMapping("/customer")
	public String tab1(Model model) {
		List<CustomerListVO> list = userService.selectCustomerList();

		model.addAttribute("list", list);

		return "customer";
	}

	@RequestMapping("/customer_sr")
	public String customer_sr(Model model, HttpServletRequest req) {

		int customer_id = Integer.parseInt(req.getParameter("customer_id"));
		List<SrVO> srList = userService.selectSRList(customer_id);

		model.addAttribute("srList", srList);
		return "customer_sr";
	}

	@RequestMapping("/details/info")
	public String sr_detail(Model model, int sr_id) {

		SrVO srvo = userService.selectSRDetail(sr_id);
		List<ActivityVO> acvo = userService.selectCustomerActivity(sr_id);

		model.addAttribute("srvo", srvo);
		model.addAttribute("acvo", acvo);
		return "details/info";
	}
	
	
	@PostMapping("/customer/delete")
	@ResponseBody
	public int deleteCustomer(@RequestParam(value = "chbox[]") List<Integer> charr) throws Exception {
		int result = 0;
		if (charr != null) {
			for (int i : charr) {
				userService.deleteCustomer(i);
			}
			result=1;
		}
		
		return result;
	}
}

