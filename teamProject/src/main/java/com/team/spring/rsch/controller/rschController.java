package com.team.spring.rsch.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class rschController {
	@RequestMapping("/rsch/rschJoinList")
	public ModelAndView list(HttpServletRequest request) {
	return new ModelAndView("rsch/rschJoinList");
	}
	@RequestMapping("/rsch/rschWrite")
	public String write() {
	return "rsch/rschWrite";
	}
	

}
	
	