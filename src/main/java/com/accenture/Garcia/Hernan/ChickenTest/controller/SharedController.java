package com.accenture.Garcia.Hernan.ChickenTest.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SharedController {
	@RequestMapping("/login")
	public String login(){
		return "login";
	}
}
