package com.team.event.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team.event.dto.EventDto;
import com.team.event.service.EventService;

@Controller
public class EventController {
	@Autowired
	private EventService service;
	
	@RequestMapping("/event/list")
	public String getList(HttpServletRequest request) {
		service.getList(request);
		return "event/list";
	}
	@RequestMapping("event/eventinsertform")
	public ModelAndView insertform(HttpServletRequest request) {
		return new ModelAndView("event/eventinsertform");
	}
	@RequestMapping("event/insert")
	public ModelAndView insert(@ModelAttribute EventDto dto, HttpServletRequest request) {
		String id="ragu";
		service.insert(dto);
		return new ModelAndView("redirect:/event/list.do");
	}
	
}
