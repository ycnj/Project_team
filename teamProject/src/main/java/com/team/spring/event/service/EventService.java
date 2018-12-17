package com.team.spring.event.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.team.spring.event.dto.EventDto;

public interface EventService {
	public void getList(HttpServletRequest request);
	public void saveContent(EventDto dto, HttpServletRequest request);
	public void getDetail(HttpServletRequest request);
	public void deleteContent(int num);
	public void getUpdateData(ModelAndView mView, int num);
	public void updateContent(EventDto dto);	
}
