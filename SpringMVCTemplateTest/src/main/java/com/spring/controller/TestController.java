package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller     
public class TestController {

	
	@RequestMapping(value = "/index",method = RequestMethod.GET)
	public String showIndex() {
	
		return "index";
	}
	
	@GetMapping("/show")
	public String showMessage(Model m) {
		
		m.addAttribute("msg", "SpringMVC");
		
		return "message";
	}
	
	@GetMapping("/")
	public String home() {
		return "home";
	}
	
}
