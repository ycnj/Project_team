package com.team.spring.rsch.service;

import java.util.List;


import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.team.spring.rsch.dto.RschListDto;





public interface RschService {
	public void getList(HttpServletRequest request);
	public void saveComm(RschListDto dto);
	public void getDetail(HttpServletRequest request);
	public void deleteComm(int cd);
	public void getUpdateData(ModelAndView mView, int cd);
	public void updateComm(RschListDto dto);

}
