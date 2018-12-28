package com.team.spring.users.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.spring.movieChart.dao.MovieChartDao;
import com.team.spring.users.dao.UsersResDao;
import com.team.spring.users.dto.UsersResDto;

@Service
public class UsersResServiceImpl implements UsersResService{
	@Autowired
	private UsersResDao dao;

	@Override
	public void showInfo(HttpServletRequest request) {
		//id에 해당하는 예매내역 가져오기
		request.setAttribute("list", dao.getData((String)request.getSession().getAttribute("id")));
	}

	@Override
	public void buyTicket(UsersResDto dto, HttpServletRequest request) {
		String id = (String)request.getSession().getAttribute("id");
		dto.setId(id);
		//영화표가격
		dto.setPrice(9000);
		//포인트 10%
		dto.setPoint((int)(dto.getPrice()*0.1));		
		dao.insert(dto);
		//id에 해당하는 예매내역 가져오기
		request.setAttribute("list", dao.getData(id));
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









