package com.ho.hwang.controller;

import java.util.List;

import com.ho.hwang.dto.Code.CodeDTO;
import com.ho.hwang.dto.Code.InsertCodeDTO;
import com.ho.hwang.responseEntity.Message;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ho.hwang.service.UserService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/*")
public class AdminController {
	private final UserService userService;

	@GetMapping("/codetable")
	public String getCodeList(Model model) {
		List<CodeDTO> list = userService.selectCodeList();
		model.addAttribute("list", list);
		return "admin/codetable";
	}

	@PostMapping("/codetable/delete")
	@ResponseBody
	public int deleteCode(@RequestParam(value = "chbox[]") List<Integer> charr) throws Exception {
		int result = userService.deleteCode(charr);
		return result;
	}
	
	@GetMapping("/enroll")
	public String enrollCode() {
		return "admin/enroll";
	}
	
	@PostMapping("/enroll")
	public ResponseEntity enrollCode(InsertCodeDTO insertCodeDTO) {
		int result = userService.insertCode(insertCodeDTO);
		Message mg;
		if(result !=0){
			mg = new Message("success", 200, result);
			return new ResponseEntity<>(mg, HttpStatus.OK);
		}else{
			mg = new Message("fail",500,result);
			return new ResponseEntity<>(mg, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

}
