package com.accenture.Garcia.Hernan.ChickenTest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.accenture.Garcia.Hernan.ChickenTest.data.RoleDAO;
import com.accenture.Garcia.Hernan.ChickenTest.data.UserDAO;
import com.accenture.Garcia.Hernan.ChickenTest.model.User;

@Controller
public class SharedController {
	
	@Autowired
	UserDAO userDAO;
	@Autowired
	RoleDAO roleDAO;
	
	
	
	
	@RequestMapping("/login")
	public String login(){
		return "login";
	}
	
	
	@RequestMapping("/register")
	public ModelAndView register(){
		
		
		ModelAndView m = new ModelAndView("register");
		m.addObject("user", new User());
		return m;
		
	}
	
	@RequestMapping(path="register", method=RequestMethod.POST)
	public String signUp(@ModelAttribute("user")User user){
		
		
		user.getRoles().add(roleDAO.getRoleByName("User"));
		
		userDAO.addUser(user);
		
		return "redirect:/login";
		
	}

	
	
	
	
}
