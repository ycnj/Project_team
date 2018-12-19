package com.team.spring.users.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.spring.users.dao.UsersResDao;
import com.team.spring.users.dto.UsersResDto;

@Service
public class UsersResServiceImpl implements UsersResService{
	@Autowired
	private UsersResDao dao;

	@Override
	public void showInfo(HttpServletRequest request) {
		request.setAttribute("dto", dao.getData((String)request.getSession().getAttribute("id")));	
	}

	@Override
	public void buyTicket(UsersResDto dto) {
		dao.insert(dto);
	}

	@Override
	public void getSumPrice(HttpServletRequest request) {
		int sumPrice=dao.getSumPrice((String)request.getSession().getAttribute("id"));
		String grade = "일반";
		if(sumPrice>1000000) {
			grade="다이아";
		}else if(sumPrice>500000) {
			grade="골드";
		}else if(sumPrice>100000) {
			grade="실버";
		}else if(sumPrice>50000) {
			grade="브론즈";
		}else{
			grade="일반";
		}
		request.setAttribute("grade", grade);
	}

	@Override
	public void cancelRes(HttpServletRequest request, UsersResDto dto) {
		dao.cancelRes(dto);		
	}
	
}









