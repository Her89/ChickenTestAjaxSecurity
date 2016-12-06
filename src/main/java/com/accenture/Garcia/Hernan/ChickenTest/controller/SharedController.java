package com.accenture.Garcia.Hernan.ChickenTest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.accenture.Garcia.Hernan.ChickenTest.data.RoleDAO;
import com.accenture.Garcia.Hernan.ChickenTest.data.UserDAO;
import com.accenture.Garcia.Hernan.ChickenTest.model.Farm;
import com.accenture.Garcia.Hernan.ChickenTest.model.User;

@Controller
public class SharedController {
	
	@Autowired
	UserDAO userDAO;
	@Autowired
	RoleDAO roleDAO;
	
	
	
	
	@RequestMapping("/login")
	public ModelAndView login(){
		ModelAndView m = new ModelAndView("login");
		m.addObject("user", new User());
		return m;
	}
	
	
	@RequestMapping("/register")
	public ModelAndView register(){
		
		
		ModelAndView m = new ModelAndView("register");
		m.addObject("user", new User());
		return m;
		
	}
	
	@RequestMapping(path="register", method=RequestMethod.POST)
	@ResponseBody
	public void signUp( User user){
		
		System.out.println(user.getPassword() + user.getUsername());
		user.getRoles().add(roleDAO.getRoleByName("User"));
		
		userDAO.addUser(user);
				
	}

	
	@RequestMapping(path="checkUser", method=RequestMethod.POST)
	public @ResponseBody String checkUser(User user){
		
		User search=userDAO.getUserByName(user.getUsername());
		
		if(search==null)
		{
			return "available";
		}
		else{
			return "N/A";
		}


	}
	
	
}
