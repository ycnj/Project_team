package com.team.spring.users.service;

import javax.servlet.http.HttpServletRequest;

import com.team.spring.users.dto.UsersResDto;

public interface UsersResService {	
	//예매 내역 불러오기
	public void showInfo(HttpServletRequest request);
	//예매 내역 넣기
	public void buyTicket(UsersResDto dto);
	//누적금액 불러오기
	public void getSumPrice(HttpServletRequest request);
	//예매 취소
	public void cancelRes(HttpServletRequest request, UsersResDto dto);
}









