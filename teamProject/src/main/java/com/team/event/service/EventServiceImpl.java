package com.team.event.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.event.dao.EventDao;
import com.team.event.dto.EventDto;

@Service
public class EventServiceImpl implements EventService {

	@Autowired
	private EventDao dao;
	
	@Override
	public void getList(HttpServletRequest request) {
		EventDto dto=new EventDto();
		List<EventDto> list=dao.getList(dto);	
		request.setAttribute("list", list);		
	}
	
	@Override
	public void insert(EventDto dto) {
		EventDao.insert(dto);		
	}

	

}
