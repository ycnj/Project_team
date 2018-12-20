package com.team.spring.users.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team.spring.users.dto.UsersResDto;
import com.team.spring.users.service.UsersResService;
@Controller
public class UsersResController {
	@Autowired
	private UsersResService service;
	
	@RequestMapping("/users/resDetail")
	public String getData(HttpServletRequest request) {
		service.showInfo(request);
		service.getSumPrice(request);
		return "users/resDetail";
	}
	
	@RequestMapping("/users/reservation")
	public String buyTicket(UsersResDto dto) {
		service.buyTicket(dto);
		return "users/resDetail";
	}

	@RequestMapping("/users/cancel")
	public String cancelRes(HttpServletRequest request, UsersResDto dto) {
		service.cancelRes(request, dto);	
		return "users/resDetail";
	}
}












































































