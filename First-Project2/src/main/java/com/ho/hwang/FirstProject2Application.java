package com.ho.hwang;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ho.hwang.service.UserService;

@SpringBootApplication
public class FirstProject2Application {

	public static void main(String[] args) {
		SpringApplication.run(FirstProject2Application.class, args);
	}

	/*
	 * @Autowired private UserService userService;
	 * 
	 * @RequestMapping("/test") public ModelAndView test() throws Exception {
	 * 
	 * ModelAndView mav = new ModelAndView("test"); mav.addObject("name", "lhh");
	 * List<String> testList = new ArrayList<String>(); testList.add("a");
	 * testList.add("b"); testList.add("c"); mav.addObject("list", testList);
	 * mav.setViewName("test.jsp");
	 * 
	 * return mav;
	 * 
	 * }
	 */

}
