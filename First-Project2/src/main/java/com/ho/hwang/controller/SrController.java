package com.ho.hwang.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ho.hwang.service.UserService;
import com.ho.hwang.vo.ActivityVO;
import com.ho.hwang.vo.CodeVO;
import com.ho.hwang.vo.SrVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class SrController {


	private final UserService userService;
	
	
	

	// ============================등록 활동 sr
	@RequestMapping("/enroll/sr")
	public String SR_enroll() {
		return "enroll/SR_enroll";
	}

	@RequestMapping(value = "/enroll/sr", method = RequestMethod.POST)
	public String SR_enroll2(Model model, SrVO srvo, Principal principal) {
		
		SimpleDateFormat fmt = new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss");
		Date time = new Date();
		
//		System.out.println("접속 시간 : " + fmt.format(time));
		//이거전에 아이디를 이름으로 바꿀 것
		String name = userService.selectName(principal.getName());
		srvo.setSr_registrant(name);
		
		//현재 날짜 삽입
		srvo.setSr_registrationDate(fmt.format(time));
		
		
		
		int type = userService.selectCode(srvo.getCode_name());
		srvo.setSr_type(type);
		int cu_id = userService.selectCustomerID(srvo.getCustomer_name());
		int p_id = userService.selectProductID(srvo.getProduct_name());

		srvo.setCustomer_id(cu_id);
		srvo.setProduct_id(p_id);

		userService.insertSR(srvo);
		return "enroll/SR_enroll";

	}

	// =================================SR디테일
	@RequestMapping("/details/sr_detail")
	public String sr_detail(Model model, int sr_id) {

		SrVO srvo = userService.selectSRDetail(sr_id);
		List<ActivityVO> acvo = userService.selectCustomerActivity(sr_id);

		model.addAttribute("srvo", srvo);
		model.addAttribute("acvo", acvo);
		return "details/sr_detail";
	}
}
