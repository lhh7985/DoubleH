package com.ho.hwang.controller;

import com.ho.hwang.service.AccountService;
import com.ho.hwang.vo.AccountVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
@RequiredArgsConstructor
public class LoginController {
	

	private final AccountService accountService;


	@GetMapping(value="/loginForm")
	public String login() {
		return "/loginForm";
	}
	
	@PostMapping(value="/register")
	public String register(AccountVo account) {
		System.out.println("로그인컨트롤러");
		System.out.println("login controller:"+account);
		accountService.save(account);
		return "redirect:/loginForm";
	}

	
	@GetMapping("/register")
	public String register() {
		return "/register";
	}
	

	@GetMapping("/user/logout")
	public String Logout() {
        return "/main";
    }
	
	

}
