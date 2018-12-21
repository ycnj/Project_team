package com.team.spring.rsch.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.team.spring.rsch.dto.RschListDto;





public interface RschService {
	public void getList(HttpServletRequest request);
	public void saveContent(RschListDto dto);
	public void getDetail(HttpServletRequest request);
	public void deleteContent(int c);
	public void getUpdateData(ModelAndView mView, int num);
	public void updateContent(RschListDto dto);

}
