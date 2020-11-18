package com.ho.hwang.controller;

import java.nio.file.OpenOption;
import java.util.List;
import java.util.Optional;

import com.ho.hwang.dto.Code.CodeDTO;
import com.ho.hwang.dto.Code.InsertCodeDTO;
import com.ho.hwang.responseEntity.Message;
import com.ho.hwang.vo.CodeVO;
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
		List<CodeVO> list = userService.selectCodeList();
		model.addAttribute("list", list);
		return "admin/codetable";
	}

	@PostMapping("/codetable/delete")
	@ResponseBody
	public ResponseEntity<Message> deleteCode(@RequestParam(value = "chbox[]") List<Integer> charr) throws Exception {
		int result = userService.deleteCode(charr);
		Message deleteMessage;
		if(result !=0){
			deleteMessage = new Message("success", 200, result);
			return new ResponseEntity<>(deleteMessage, HttpStatus.OK);
		}else{
			deleteMessage = new Message("fail",500,result);
			return new ResponseEntity<>(deleteMessage, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@GetMapping("/enroll")
	public String enrollCode() {
		return "admin/enroll";
	}
	
	@PostMapping("/enroll")
	public ResponseEntity<Message> enrollCode(InsertCodeDTO insertCodeDTO) {
		InsertCodeDTO result = userService.insertCode(insertCodeDTO);

		Message insertMessage;
		//키값이 존재하면 성공 존재하지않으면 실패
		if(result.getCode_id() != 0){
			insertMessage = new Message("success", 200, result);
			return new ResponseEntity<>(insertMessage, HttpStatus.OK);
		}else{
			insertMessage = new Message("fail",500,result);
			return new ResponseEntity<>(insertMessage, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

}
