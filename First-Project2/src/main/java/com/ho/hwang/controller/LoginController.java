package com.ho.hwang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ho.hwang.account.Account;
import com.ho.hwang.account.AccountService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class LoginController {
	

	private final AccountService accountService;


	@GetMapping(value="/loginForm")
	public String login() {
		return "loginForm";
	}
//	
//	@GetMapping(value = "/loginForm")
//	  public String login(@AuthenticationPrincipal User user){
//	    if(user != null) {
//	      if(user.getAuthorities().contains(new SimpleGrantedAuthority("ROLE_USER"))) {
//	        return "redirect:/main";
//	      }
//	    }
//	    return "loginForm";
//	  }
	
	@PostMapping(value="/register")
	public String register(Account account) {
		System.out.println(account.getPassword());
		accountService.save(account);
		return "redirect:/loginForm";
	}

	
	@GetMapping("/register")
	public String register() {
		return "register";
	}
	

	@GetMapping("/user/logout")
	public String dispLogout() {
        return "/main";
    }
	
	

}
