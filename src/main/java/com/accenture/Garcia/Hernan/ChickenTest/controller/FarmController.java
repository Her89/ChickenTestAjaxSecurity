package com.accenture.Garcia.Hernan.ChickenTest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.accenture.Garcia.Hernan.ChickenTest.data.FarmDAO;
import com.accenture.Garcia.Hernan.ChickenTest.model.Farm;


@Controller
@RequestMapping("/")
public class FarmController {
	
	@Autowired
	FarmDAO farmDAO;
	
	@RequestMapping("/")
	public ModelAndView List1(){
		ModelAndView m = new ModelAndView("Farms/List");

		return m;
	}
	
	@RequestMapping("/list")
	public @ResponseBody List<Farm> ListAjax(){
		List<Farm> farmList = farmDAO.listFarm();
		return farmList;
	}
		
		
		@RequestMapping("Delete/{id}")
	public @ResponseBody void DeleteAjax (@PathVariable("id")String id){
		
		farmDAO.deleteFarm(Long.parseLong(id));
		
	}

	
		@RequestMapping(path="New", method=RequestMethod.POST, headers = "Accept=application/json")
		public @ResponseBody Farm newFarmAjax(Farm farm){
			
			farmDAO.addFarm(farm);
			return farm;

		}
	
		@RequestMapping(path="Update", method=RequestMethod.POST)
		public @ResponseBody void updateFarmAjax(Farm farm){
		
			farmDAO.updateFarm(farm);

		}
	

}
