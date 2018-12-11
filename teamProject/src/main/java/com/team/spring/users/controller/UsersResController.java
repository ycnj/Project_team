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
	
	@RequestMapping("/users/usersRes/detail")
	public String getData(HttpServletRequest request) {
		service.showInfo(request);
		return "users/usersRes/detail";
	}
	
	@RequestMapping("/users/usersRes/reservation")
	public String buyTicket(UsersResDto dto) {
		service.buyTicket(dto);
		return "users/usersRes/detail";
	}

	@RequestMapping("/users/usersRes/grade")
	public String showGrade(HttpServletRequest request) {
		service.getSumPrice(request);	
		return "users/usersRes/grade";
	}

	@RequestMapping("/users/usersRes/cancel")
	public String cancelRes(HttpServletRequest request, UsersResDto dto) {
		service.cancelRes(request, dto);	
		return "users/usersRes/detail";
	}
}












































































