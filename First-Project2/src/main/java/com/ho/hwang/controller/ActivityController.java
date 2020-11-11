package com.ho.hwang.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ho.hwang.service.ActivityService;
import com.ho.hwang.service.UserService;
import com.ho.hwang.vo.ActivityVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/activity/*")
public class ActivityController {

	private final UserService userService;
	private final ActivityService actService;

	//// 활동 검색 및 개발 완료 버튼
	@GetMapping("/list")
	public String activity(Model model) {
		List<ActivityVO> activity = actService.selectActivity();
		model.addAttribute("activity", activity);
		return "activity/list";
	}

	@PostMapping("/list")
	@ResponseBody
	public String activity_complete(Model model, int activity_id) {
		actService.updateComplete(activity_id);
		return "redirect:/activity/list";
	}

	@PostMapping("detail")
	@ResponseBody
	public String activity_complete2(Model model, int activity_id) {
		actService.updateComplete(activity_id);
		return "redirect:/activity/detail";
	}

	// 고객사별 SR에대한 활동 추가
	@GetMapping("/enroll-sr")
	public String enroll_activity(Model model, HttpServletRequest req) {
		int sr_id = Integer.parseInt(req.getParameter("sr_id"));
		model.addAttribute("sr_id", sr_id);
		return "/activity/enroll-sr";
	}

	@PostMapping("/enroll-sr")
	public void enroll_act(ActivityVO activityvo, Principal principal) {
		String name = userService.selectName(principal.getName());
		activityvo.setActivity_registrant(name);
		int type = userService.selectCode(activityvo.getType());
		activityvo.setActivity_type(type);
		actService.insertCustomerActivity(activityvo);
	}

	// 활동 등록
	@PostMapping("/enroll-employee")
	public String activity_enroll(ActivityVO activityVO) {
		int type = userService.selectCode(activityVO.getType());
		System.out.println(activityVO.getActivity_estimatedDate());
		activityVO.setActivity_type(type);
		actService.insertActivity(activityVO);
		return "redirect:/activity";
	}

	@GetMapping("/enroll-employee")
	public String activity_enroll(Model model) {
		return "activity/enroll-employee";
	}
}
