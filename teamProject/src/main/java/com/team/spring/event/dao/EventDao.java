package com.team.spring.event.dao;

import java.util.List;

import com.team.spring.event.dto.EventDto;

public interface EventDao {
	public List<EventDto> getList(EventDto dto);
	public void insert(EventDto dto);
	public void addViewCount(int num);
	public void delete(int num);
	public void update(EventDto dto);
}
