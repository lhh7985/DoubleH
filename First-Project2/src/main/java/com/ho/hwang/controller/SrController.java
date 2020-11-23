package com.ho.hwang.controller;

import java.security.Principal;
import java.util.List;

import com.ho.hwang.dto.Activity.SelectCustomerActivityDTO;
import com.ho.hwang.dto.Sr.InsertSrDTO;
import com.ho.hwang.dto.Sr.SelectSrDTO;
import com.ho.hwang.dto.Sr.SelectSrDetailDTO;
import com.ho.hwang.paging.Page;
import com.ho.hwang.service.ProductService;
import com.ho.hwang.vo.SrVO;
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

		List<SelectSrDTO> srList = srService.selectSR(paging.getStartIndex(), paging.getPageSize());
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
	public void enrollSr(InsertSrDTO insertSrDTO, Principal principal) {
		srService.insertSR(insertSrDTO, principal);
	}

	// =================================SR디테일
	@GetMapping("/detail")
	public String getSrDetail(Model model, int sr_id) {
		SrVO srvo = srService.selectSRDetail(sr_id);
		List<SelectCustomerActivityDTO> selectCustomerActivityDTO = activityService.selectCustomerActivity(sr_id);

		model.addAttribute("srvo", srvo);
		model.addAttribute("acvo", selectCustomerActivityDTO);

		return "sr/detail";
	}
}
