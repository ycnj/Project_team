package com.team.spring.user.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.team.spring.user.dto.UserCommentDto;
import com.team.spring.user.dto.UserDto;

public interface UserService {
	public void getList(HttpServletRequest request);
	public void saveContent(UserDto dto);
	public void getDetail(HttpServletRequest request);
	public void deleteContent(int num);
	public void getUpdateData(ModelAndView mView, int num);
	public void updateContent(UserDto dto);
	public void deleteComment(int num);
	public void saveComment(HttpServletRequest request);
	public void updateComment(UserCommentDto dto);
}












