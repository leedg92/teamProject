package com.itbank.controller;


import java.util.HashMap;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.apache.http.HttpRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import com.itbank.dao.ReserVO;
import com.itbank.service.ReserService;


@Controller
public class ReserController {

	@Autowired ReserService reserService;
	
	@RequestMapping(value = "/reservation", method = RequestMethod.GET)
	public ModelAndView reser(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("reservation/reservation");
		System.out.println("key:"+ request.getAttribute("key"));
		mv.addObject("key", request.getAttribute("key"));
		return mv;		
	}

	@RequestMapping(value = "/reservation", method = RequestMethod.POST)
	public ModelAndView reser(ReserVO vo) {
		int key = vo.getKey();
		ModelAndView mv = new ModelAndView("redirect:/storeview?key="+key);
		int row = reserService.reserInsert(vo);
		
		return mv;
	}
	
	@RequestMapping("/result")
	public String result() {

		return "reservation/reserResult";
	}
	

	@RequestMapping("/search")
	public String search(Model model,HttpServletRequest request) {
		
		String resname = request.getParameter("resname");
		model.addAttribute("resname",resname);
		return "reservation/reserModify";
	}
	
	@RequestMapping(value = "getUser", produces="application/text;charset=utf8")
	@ResponseBody
	public String getUser(@RequestParam("resname") String resname) {

		ReserVO vo = null;
		ObjectMapper jsonMapper = new ObjectMapper();		

		String jsonString = null;
		
		try {

			vo = reserService.getUser(resname);

			jsonString = jsonMapper.writeValueAsString(vo);
			
		} catch (JsonProcessingException e) {
	
			e.printStackTrace();
		}

		System.out.println("json : "+jsonString);
		return vo != null ? jsonString : null;
	}
	
	// 3. �삁�빟 �닔�젙
	@RequestMapping(value = "/reserModify", method = RequestMethod.GET)
	public ModelAndView  memberModify() {
		return new ModelAndView("reservation/reserModify");
	}
	
	@RequestMapping("/reserModify")
	public ModelAndView memberModify(String resdate,@RequestParam HashMap<String, String> reservation) {
		ModelAndView mv = new ModelAndView("reservation/reserModify");
		Integer row = reserService.modifyMember(reservation);
		mv.addObject("row", row);
		
		return mv;
	}
	
	
	@RequestMapping("/reserDelete")
	public ModelAndView memberDelete(@RequestParam int key,@RequestParam String resname) {
		ModelAndView mv = new ModelAndView("redirect:/myPage");
		int row = reserService.deleteMember(resname,key);
		mv.addObject("row",row);
		return mv;
		
	}
}
	
	
	

	
	
	

