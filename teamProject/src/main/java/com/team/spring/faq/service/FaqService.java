package com.team.spring.faq.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.team.spring.faq.dto.FaqDto;

public interface FaqService {
	public void getList(HttpServletRequest request);
	public void saveContent(FaqDto dto);
	public void getDetail(HttpServletRequest request);
	public void deleteContent(int num);
	public void getUpdateData(ModelAndView mView, int num);
	public void updateContent(FaqDto dto);	
}












