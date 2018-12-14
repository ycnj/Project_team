package com.team.spring.rschservice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.team.spring.rsch.InsertRschReg;
import com.team.spring.rsch.dto.rschListDto;
import com.team.spring.rsch.dto.rschWriteDto;

public interface rschService {
	public void getList(HttpServletRequest request);
	public void saveContent(rschListDto dto);
	public void getDetail(HttpServletRequest request);
	public void getUpdateData(ModelAndView mView, int cd);
	public void updateContent(rschListDto dto);
	public void deleteList(int cd);
	public void saveList(HttpServletRequest request);
	public void updateList(rschWriteDto dto);
	
}
	
	
	
	
