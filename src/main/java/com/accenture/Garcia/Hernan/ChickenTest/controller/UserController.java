package com.accenture.Garcia.Hernan.ChickenTest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.accenture.Garcia.Hernan.ChickenTest.data.RoleDAO;
import com.accenture.Garcia.Hernan.ChickenTest.data.UserDAO;
import com.accenture.Garcia.Hernan.ChickenTest.model.Role;
import com.accenture.Garcia.Hernan.ChickenTest.model.User;

@Controller
@RequestMapping("Users")
public class UserController {
	
	@Autowired
	UserDAO userDAO;
	@Autowired
	RoleDAO roleDAO;
	
	@RequestMapping("/")
	public String users(){
		
		return "users";
	}
	
	@RequestMapping("/List")
	public @ResponseBody List<User>  usersList(){
		List<User> users =userDAO.listUser();
		return users;
	}
	
	@RequestMapping("/Delete/{id}")
	public @ResponseBody void  Delete(@PathVariable("id")String id){
		userDAO.deleteUser(Long.parseLong(id));
	}
	
	@RequestMapping("/RoleList")
	public @ResponseBody List<Role>  roleList(){
		List<Role> roles =roleDAO.listRole();
		return roles;
	}
	
	

}
