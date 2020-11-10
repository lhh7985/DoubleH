package com.ho.hwang.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ho.hwang.service.UserService;
import com.ho.hwang.vo.ActivityVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ActController {
	
	private final UserService userService;
	
	////활동 검색 및 개발 완료 버튼
	@RequestMapping(value="/activity")
	public String activity(Model model) {
		
		List<ActivityVO> activity = userService.selectActivity();
		model.addAttribute("activity", activity);
		return "activity";
	}	
	
	@RequestMapping(value="/activity", method=RequestMethod.POST)
	@ResponseBody
	public String activity_complete(Model model,int activity_id) {
		userService.updateComplete(activity_id);
		return "redirect:/activity";
	}	
	
	@RequestMapping(value="details/sr_detail", method=RequestMethod.POST)
	@ResponseBody
	public String activity_complete2(Model model,int activity_id) {
		userService.updateComplete(activity_id);
		return "redirect:/details/sr_detail";
	}	
	
	//고객사별 SR에대한 활동 추가
		@RequestMapping("/enroll/activity")
		public String enroll_activity( Model model,HttpServletRequest req) {
			int sr_id = Integer.parseInt( req.getParameter("sr_id"));
			model.addAttribute("sr_id", sr_id);
			return "enroll/activity";
		}
		
		@RequestMapping(value="/enroll/activity", method = RequestMethod.POST)
		public void enroll_act(ActivityVO activityvo, Principal principal) {
			
			//이거전에 아이디를 이름으로 바꿀 것
			String name = userService.selectName(principal.getName());
			activityvo.setActivity_registrant(name);
			
			
			int type = userService.selectCode(activityvo.getType());
			activityvo.setActivity_type(type);
			
			userService.insertCustomerActivity(activityvo);
			
		}
		
		
		//활동 등록
		@RequestMapping(value="/enroll/activity_enroll", method= RequestMethod.POST)
		public String activity_enroll(ActivityVO activityVO) {
			
			
			int type = userService.selectCode(activityVO.getType());
			System.out.println(activityVO.getActivity_estimatedDate());
			
			activityVO.setActivity_type(type);
			userService.insertActivity(activityVO);
			return "redirect:/activity";
		}
		
		
		@RequestMapping("/customer_activity")
		public String customer_activity(Model model, HttpServletRequest req) {
			
			int customer_id = Integer.parseInt( req.getParameter("customer_id"));
			List<ActivityVO> list = userService.selectVisit(customer_id);
			model.addAttribute("list", list);
			
			return "customer_activity";
		}
		
		
		@RequestMapping("/enroll/activity_enroll")
		public String activity_enroll(Model model) {
			return "enroll/activity_enroll";
		}
}
