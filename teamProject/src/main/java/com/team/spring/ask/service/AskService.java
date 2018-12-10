package com.team.spring.ask.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.team.spring.ask.dto.AskDto;

public interface AskService {
	public void getList(HttpServletRequest request);
	public void saveContent(AskDto dto);
	public void getDetail(HttpServletRequest request);
	public void deleteContent(int num);
	public void getUpdateData(ModelAndView mView, int num);
	public void updateContent(AskDto dto);
}












