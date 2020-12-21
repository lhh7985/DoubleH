package com.ho.hwang.controller;

import com.ho.hwang.dto.Code.InsertCodeDto;
import com.ho.hwang.dto.Code.UpdateCodeDto;
import com.ho.hwang.paging.JqgridResponse;
import com.ho.hwang.responseEntity.Message;
import com.ho.hwang.service.UserService;
import com.ho.hwang.vo.CodeVo;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/*")
public class AdminController {
	private final UserService userService;

	@GetMapping("/codetable")
	public String getCodeList(@RequestParam(defaultValue = "1") int page, Model model) {
		return "admin/codetable";
	}
	@GetMapping("/getlist")
	public @ResponseBody
	JqgridResponse getAll() {
		List<CodeVo> codeList = userService.selectCodeList();
		JqgridResponse response = new JqgridResponse();
		response.setRows(codeList);
		return response;
	}

	@PostMapping("/codetable/delete")
	@ResponseBody
	public ResponseEntity<Message> deleteCode(@RequestParam(value="id") Integer codeId) throws Exception {
		int result = userService.deleteCode(codeId);
		Message deleteMessage;
		deleteMessage = new Message("success", 200, result);
		return new ResponseEntity<>(deleteMessage, HttpStatus.OK);

	}
	
	@GetMapping("/enroll")
	public String enrollCode() {
		return "admin/enroll";
	}
	
	@PostMapping("/enroll")
	public ResponseEntity<Message> enrollCode(InsertCodeDto insertCodeDto) {
		CodeVo result = userService.insertCode(insertCodeDto);

		Message insertMessage;
		insertMessage = new Message("success", 200, result);
		return new ResponseEntity<>(insertMessage, HttpStatus.OK);
	}

	@PostMapping("/codetable/update")
	@ResponseBody
	public int updateCodeTable(@RequestParam("codeGroup") String codeGroup,
							  @RequestParam("codeUpper") String codeUpper,
							  @RequestParam("codeName") String codeName,
							  @RequestParam("codeStatus") String codeStatus,
							  @RequestParam("id") int codeId){
		UpdateCodeDto updateCodeDto = UpdateCodeDto.builder()
				.codeGroup(codeGroup)
				.codeUpper(codeUpper)
				.codeName(codeName)
				.codeStatus(codeStatus)
				.codeId(codeId)
				.build();
		int result = userService.updateCodeTable(updateCodeDto);
		return result;
	}

}
