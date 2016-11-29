package com.accenture.Garcia.Hernan.ChickenTest.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.accenture.Garcia.Hernan.ChickenTest.data.ChickenDAO;
import com.accenture.Garcia.Hernan.ChickenTest.data.FarmDAO;
import com.accenture.Garcia.Hernan.ChickenTest.model.Chicken;
import com.accenture.Garcia.Hernan.ChickenTest.model.Farm;

@Controller
@RequestMapping("Chickens")
public class ChickenController {
	
	@Autowired
	ChickenDAO chickenDAO;
	@Autowired
	FarmDAO farmDAO;
	
	@RequestMapping("/{id}")
	public ModelAndView chickenList(@PathVariable("id")String farmId){
		ModelAndView m = new ModelAndView("Chickens/List");
		return m;
	}
	
	
	
	@RequestMapping("/list/{id}")
	public @ResponseBody Farm ListAjax(@PathVariable("id")String farmId){
		Farm farm = farmDAO.getFarm(Long.parseLong(farmId));
		return farm;
	}
		
		@RequestMapping("Delete/{id}")
	public @ResponseBody void DeleteAjax (@PathVariable("id")String id){
		
		chickenDAO.deleteChicken(Long.parseLong(id));
		
	}

	
		@RequestMapping(path="New/{id}", method=RequestMethod.POST)
		public @ResponseBody Chicken newChickenAjax(@PathVariable("id")String farmId, Chicken chicken){
			
			Farm farm =farmDAO.getFarm(Long.parseLong(farmId));
			
			chicken.setFarm(farm);
			
			
			chickenDAO.addChicken(chicken);
			return chicken ;

		}
	
		@RequestMapping(path="Update/{id}", method=RequestMethod.POST)
		public @ResponseBody void updateChickenAjax(@PathVariable("id")String farmId, Chicken chicken){
		
			Farm farm =farmDAO.getFarm(Long.parseLong(farmId));
			chicken.setFarm(farm);


			chickenDAO.updateChicken(chicken);

		}
	

}
