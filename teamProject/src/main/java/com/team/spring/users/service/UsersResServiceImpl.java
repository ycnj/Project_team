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
			grade="VVIP";
		}else if(sumPrice>500000) {
			grade="VIP PREMIUM";
		}else if(sumPrice>50000) {
			grade="VIP";
		}
		request.setAttribute("grade", grade);
	}

	@Override
	public void cancelRes(HttpServletRequest request, UsersResDto dto) {
		dao.cancelRes(dto);		
	}
	
}









