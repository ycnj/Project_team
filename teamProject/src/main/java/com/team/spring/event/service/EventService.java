package com.team.spring.event.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import com.team.spring.event.dto.EventDto;

public interface EventService {
	public void getList(HttpServletRequest request);
	public void getDetail(HttpServletRequest request);
	public void saveContent(EventDto dto, HttpServletRequest request);	
	public void deleteContent(int num, HttpServletRequest request, HttpServletResponse response);
	public void updateContent(EventDto dto, HttpServletRequest request);	
	public void addViewCount(int num);
}
