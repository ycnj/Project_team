package com.team.event.service;

import javax.servlet.http.HttpServletRequest;

import com.team.event.dto.EventDto;

public interface EventService {
	public void getList(HttpServletRequest request);
	public void insert(EventDto dto);
}
