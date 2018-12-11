package com.team.event.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EventController {
	@Autowired
	private EventService service;
	
	@RequestMapping("/event/list")
	public ModelAndView getList(HttpServletRequest request) {
		service.get
	}
}
