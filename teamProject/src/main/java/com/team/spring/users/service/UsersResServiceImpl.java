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
		dao.getData(request.getSession().getId());		
	}

	@Override
	public void buyTicket(UsersResDto dto) {
		dao.insert(dto);
	}

	@Override
	public void getSumPrice(HttpServletRequest request) {
		int sumPrice=dao.getSumPrice((String)request.getSession().getAttribute("id"));
		int grade = 4;
		if(sumPrice>1000000) {
			grade=0;
		}else if(sumPrice>500000) {
			grade=1;
		}else if(sumPrice>100000) {
			grade=2;
		}else if(sumPrice>50000) {
			grade=3;
		}else{
			grade=4;
		}
		request.setAttribute("grade", grade);
	}

	@Override
	public void cancelRes(HttpServletRequest request, UsersResDto dto) {
		dao.cancelRes(dto);		
	}
	
}









