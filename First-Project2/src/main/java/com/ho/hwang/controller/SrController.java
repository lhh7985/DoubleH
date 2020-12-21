package com.ho.hwang.controller;

import com.ho.hwang.dto.Sr.InsertSrDto;
import com.ho.hwang.dto.Sr.SelectSrDetailDto;
import com.ho.hwang.dto.Sr.SelectSrDto;
import com.ho.hwang.dto.Sr.UpdateSrDetailDto;
import com.ho.hwang.paging.JqgridResponse;
import com.ho.hwang.service.ActivityService;
import com.ho.hwang.service.ProductService;
import com.ho.hwang.service.SrService;
import com.ho.hwang.service.UserService;
import com.ho.hwang.vo.ActivityVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;
import java.util.NoSuchElementException;

@Controller
@RequiredArgsConstructor
@RequestMapping("/sr/*")
public class SrController {

	private final UserService userService;
	private final SrService srService;
	private final ActivityService activityService;
	private final ProductService productService;

	@GetMapping("/list")
	public String getSrList(Principal principal) {
		return "sr/list";
	}

	@GetMapping("/getlist")
	public @ResponseBody
	JqgridResponse getAll() {
		List<SelectSrDto> srList = srService.selectSR();
		JqgridResponse response = new JqgridResponse();
		response.setRows(srList);
		return response;
	}

	// ============================등록 활동 sr
	@GetMapping("/enroll")
	public String enrollSr() {
		return "sr/enroll";
	}

	@PostMapping("/enroll")
	public void enrollSr(InsertSrDto insertSrDto, Principal principal) {
		srService.insertSR(insertSrDto, principal);
	}

	// =================================SR디테일
	@GetMapping("/{srId}/detail")
	public String getSrDetail(Model model, @PathVariable("srId") int srId) {

		SelectSrDetailDto selectSrDetailDto = srService.selectSRDetail(srId)
				.map((srVo)->new SelectSrDetailDto(srVo))
				.orElseThrow(() -> new NoSuchElementException());
		model.addAttribute("srvo", selectSrDetailDto);


		List<ActivityVo> activityVo = activityService.selectCustomerActivity(srId);
		model.addAttribute("acvo", activityVo);

		return "sr/detail";
	}

	@GetMapping("/delete/{srId}")
	@ResponseBody
	public int deleteSr(@PathVariable("srId") int srId){
		int result = srService.deleteSr(srId);
		return result;
	}

	@PostMapping("/complete/{srId}")
	@ResponseBody
	public int setSrCompletion(@PathVariable("srId") int srId, Principal principal){
		return srService.updateSrComplete(srId, principal);
	}

	@PostMapping("/update")
	@ResponseBody
	public int modifySrDetail(UpdateSrDetailDto updateSrDetailDto, Principal principal){
		return srService.updateSrDetail(updateSrDetailDto, principal);
	}
}
