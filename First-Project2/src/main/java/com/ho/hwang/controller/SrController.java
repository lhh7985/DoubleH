package com.ho.hwang.controller;

import java.security.Principal;
import java.util.List;
import java.util.Optional;

import com.ho.hwang.dto.Activity.SelectCustomerActivityDto;
import com.ho.hwang.dto.Sr.InsertSrDto;
import com.ho.hwang.dto.Sr.SelectSrDetailDto;
import com.ho.hwang.dto.Sr.SelectSrDto;
import com.ho.hwang.paging.Page;
import com.ho.hwang.service.ProductService;
import com.ho.hwang.vo.ActivityVo;
import com.ho.hwang.vo.SrVo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ho.hwang.service.ActivityService;
import com.ho.hwang.service.SrService;
import com.ho.hwang.service.UserService;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequiredArgsConstructor
@RequestMapping("/sr/*")
public class SrController {

	private final UserService userService;
	private final SrService srService;
	private final ActivityService activityService;
	private final ProductService productService;

	@GetMapping("/list")
	public String getSrList(@RequestParam(defaultValue = "1") int page, Model model) {

		int listCnt = srService.selectSrTotalCount();
		Page paging = new Page(listCnt, page);

		List<SelectSrDto> srList = srService.selectSR(paging.getStartIndex(), paging.getPageSize());
		model.addAttribute("srList", srList);
		model.addAttribute("paging", paging);

		return "sr/list";
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
}
