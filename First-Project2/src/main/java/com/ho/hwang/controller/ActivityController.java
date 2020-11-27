package com.ho.hwang.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.ho.hwang.dto.Activity.InsertActivityDto;
import com.ho.hwang.dto.Activity.InsertCustomerActivityDto;
import com.ho.hwang.dto.Activity.SelectActivityDto;
import com.ho.hwang.responseEntity.Message;
import com.ho.hwang.vo.ActivityVo;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ho.hwang.service.ActivityService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/activity/*")
public class ActivityController {

	private final ActivityService activityService;

	//// 활동 검색 및 개발 완료 버튼
	@GetMapping("/list")
	public String getList(Model model) {
		List<SelectActivityDto> activity = activityService.selectActivity();
		model.addAttribute("activity", activity);
		return "activity/list";
	}

	@PostMapping("/list")
	@ResponseBody
	public String setListComplete(Model model, int activityId) {
		activityService.updateComplete(activityId);
		return "redirect:/activity/list";
	}

	@PostMapping("detail")
	@ResponseBody
	public String setDetailComplete(Model model, int activityId) {
		activityService.updateComplete(activityId);
		return "redirect:/activity/detail";
	}

	// 고객사별 SR에대한 활동 추가
	@GetMapping("/enroll/sr")
	public String enrollSr(Model model, HttpServletRequest req) {
		int srId = Integer.parseInt(req.getParameter("srId"));
		model.addAttribute("srId", srId);
		return "/activity/enroll-sr";
	}

	@PostMapping("/enroll/sr")
	public ResponseEntity<Message> enrollSr(InsertCustomerActivityDto insertCustomerActivityDto, Principal principal) {

		ActivityVo activityVo = activityService.insertCustomerActivity(insertCustomerActivityDto, principal);
		return new ResponseEntity<>(new Message("success", 200, activityVo), HttpStatus.OK);
	}

	// 활동 등록
	@PostMapping("/enroll/employee")
	public ResponseEntity<Message> enrollEmployee(InsertActivityDto insertActivityDto, Principal principal) {

		ActivityVo activityVo = activityService.insertActivity(insertActivityDto, principal);
		return new ResponseEntity<>(new Message("success", 200, activityVo), HttpStatus.OK);

	}

	@GetMapping("/enroll/employee")
	public String enrollEmployee(Model model) {
		return "activity/enroll-employee";
	}
}
