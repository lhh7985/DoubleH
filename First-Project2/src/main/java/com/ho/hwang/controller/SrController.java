package com.ho.hwang.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ho.hwang.service.ActivityService;
import com.ho.hwang.service.SrService;
import com.ho.hwang.service.UserService;
import com.ho.hwang.vo.ActivityVO;
import com.ho.hwang.vo.SrVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/sr/*")
public class SrController {

	private final UserService userService;
	private final SrService srService;
	private final ActivityService actService;

	@GetMapping("/list")
	public String SR(Model model) {
		List<SrVO> srList = srService.selectSR();
		model.addAttribute("srList", srList);

		return "sr/list";
	}

	// ============================등록 활동 sr
	@GetMapping("/enroll")
	public String SR_enroll() {
		return "sr/enroll";
	}

	@PostMapping("/enroll")
	public String SR_enroll2(Model model, SrVO srvo, Principal principal) {
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date time = new Date();

		String name = userService.selectName(principal.getName());
		srvo.setSr_registrant(name);

		// 현재 날짜 삽입
		srvo.setSr_registrationDate(fmt.format(time));
		int type = userService.selectCode(srvo.getCode_name());
		srvo.setSr_type(type);
		int cu_id = userService.selectCustomerID(srvo.getCustomer_name());
		int p_id = userService.selectProductID(srvo.getProduct_name());

		srvo.setCustomer_id(cu_id);
		srvo.setProduct_id(p_id);
		srService.insertSR(srvo);

		return "sr/enroll";
	}

	// =================================SR디테일
	@GetMapping("/detail")
	public String sr_detail(Model model, int sr_id) {
		SrVO srvo = srService.selectSRDetail(sr_id);
		List<ActivityVO> acvo = actService.selectCustomerActivity(sr_id);

		model.addAttribute("srvo", srvo);
		model.addAttribute("acvo", acvo);

		return "sr/detail";
	}
}
