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

import com.ho.hwang.dto.ActivityDTO.insertActivityDTO;
import com.ho.hwang.dto.ActivityDTO.insertCustomerActivityDTO;
import com.ho.hwang.dto.ActivityDTO.selectActivityDTO;
import com.ho.hwang.service.ActivityService;
import com.ho.hwang.service.UserService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/activity/*")
public class ActivityController {

	private final UserService userService;
	private final ActivityService activityService;

	//// 활동 검색 및 개발 완료 버튼
	@GetMapping("/list")
	public String activity(Model model) {
		List<selectActivityDTO> activity = activityService.selectActivity();
		model.addAttribute("activity", activity);
		return "activity/list";
	}

	@PostMapping("/list")
	@ResponseBody
	public String activity_complete(Model model, int activity_id) {
		activityService.updateComplete(activity_id);
		return "redirect:/activity/list";
	}

	@PostMapping("detail")
	@ResponseBody
	public String activity_complete2(Model model, int activity_id) {
		activityService.updateComplete(activity_id);
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
	public void enroll_act(insertCustomerActivityDTO activityVO, Principal principal) {
		String name = userService.selectName(principal.getName());
		activityVO.setActivity_registrant(name);
		int activity_type = userService.selectCode(activityVO.getType());
		activityVO.setActivity_type(activity_type);
		activityService.insertCustomerActivity(activityVO);
	}

	// 활동 등록
	@PostMapping("/enroll-employee")
	public String activity_enroll(insertActivityDTO activityVO, Principal principal) {
		String name = userService.selectName(principal.getName());
		activityVO.setActivity_registrant(name);
		int type = userService.selectCode(activityVO.getType());
		activityVO.setActivity_type(type);
		activityService.insertActivity(activityVO);
		return "redirect:/activity/list";
	}

	@GetMapping("/enroll-employee")
	public String activity_enroll(Model model) {
		return "activity/enroll-employee";
	}
}
