package com.ho.hwang.controller;

import com.ho.hwang.dto.Activity.InsertActivityDto;
import com.ho.hwang.dto.Activity.InsertCustomerActivityDto;
import com.ho.hwang.dto.Activity.SelectActivityDto;
import com.ho.hwang.dto.Activity.UpdateActivityDto;
import com.ho.hwang.paging.JqgridResponse;
import com.ho.hwang.responseEntity.Message;
import com.ho.hwang.service.ActivityService;
import com.ho.hwang.vo.ActivityVo;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;
import java.util.NoSuchElementException;

@Controller
@RequiredArgsConstructor
@RequestMapping("/activity/*")
public class ActivityController {

	private final ActivityService activityService;

	//jqGrid로 활동 목록 출력
	@GetMapping("/list")
	public String getList() {
		return "activity/list";
	}

	@GetMapping("/getlist")
	public @ResponseBody JqgridResponse getAll() {
		List<SelectActivityDto> activityList = activityService.selectActivity();
		JqgridResponse response = new JqgridResponse();
		response.setRows(activityList);
		return response;
	}

	//activity 완료하기
	@PostMapping("/complete/{activityId}")
	@ResponseBody
	public int setListComplete(Model model, @PathVariable("activityId") int activityId) {
		return activityService.updateComplete(activityId);
	}


	@GetMapping("/{activityId}/detail")
	public String getActivityDetail(Model model, @PathVariable("activityId") int activityId){
		SelectActivityDto selectActivityDto = activityService.selectActivityDetail(activityId)
				.map((activityVo)-> new SelectActivityDto(activityVo))
				.orElseThrow(()-> new NoSuchElementException());
		model.addAttribute("activityDetail", selectActivityDto);
		return "activity/detail";
	}

	@PostMapping("/update/employee")
	@ResponseBody
	public int updateActivity(UpdateActivityDto updateActivityDto, Principal principal){
		int result = activityService.updateActivity(updateActivityDto, principal);
		return result;
	}

	@PostMapping("/detail")
	@ResponseBody
	public String setDetailComplete(Model model, int activityId) {
		activityService.updateComplete(activityId);
		return "redirect:/activity/detail";
	}

	// 고객사별 SR에대한 활동 추가
	@GetMapping("/enroll/sr/{srId}")
	public String enrollSr(Model model, @PathVariable("srId") int srId) {
		model.addAttribute("srId", srId);
		return "/activity/enroll-sr";
	}

	@PostMapping("/enroll/sr")
	public ResponseEntity<Message> enrollSr(InsertCustomerActivityDto insertCustomerActivityDto, Principal principal) {

		ActivityVo activityVo = activityService.insertCustomerActivity(insertCustomerActivityDto, principal);
		return new ResponseEntity<>(new Message("success", 200, activityVo), HttpStatus.OK);
	}

	// 활동 등록
	@GetMapping("/enroll/employee")
	public String enrollEmployee() {
		return "activity/enroll-employee";
	}

	@PostMapping("/enroll/employee")
	public ResponseEntity<Message> enrollEmployee(InsertActivityDto insertActivityDto, Principal principal) {

		ActivityVo activityVo = activityService.insertActivity(insertActivityDto, principal);
		return new ResponseEntity<>(new Message("success", 200, activityVo), HttpStatus.OK);
	}

	@GetMapping("/delete/{activityId}")
	@ResponseBody
	public int deleteActivity(@PathVariable("activityId") int activityId){
		int result = activityService.deleteActivity(activityId);
		return result;
	}


}
