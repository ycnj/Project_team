package com.team.spring.freeboard.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import com.team.spring.freeboard.dto.FreeBoardCommentDto;
import com.team.spring.freeboard.dto.FreeBoardDto;


public interface FreeBoardService {
	public void getList(HttpServletRequest request);
	public void getDetail(HttpServletRequest request);
	public void deleteContent(int num, FreeBoardDto dto, HttpServletRequest request);
	public void getUpdateData(ModelAndView mView, int num);
	public void updateContent(FreeBoardDto dto);
	
	public void deleteComment(int num);
	public void saveComment(HttpServletRequest request);
	public void updateComment(FreeBoardCommentDto dto);
	
	public void saveContent(FreeBoardDto dto, HttpServletRequest request);
	
	public void getFileData(ModelAndView mView, int num);

	
}	
