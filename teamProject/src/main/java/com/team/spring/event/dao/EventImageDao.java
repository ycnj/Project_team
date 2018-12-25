package com.team.spring.event.dao;

import java.util.List;

import com.team.spring.event.dto.EventDto;
import com.team.spring.event.dto.EventImageDto;

public interface EventImageDao {
	public void insert(EventImageDto dto);
	public void delete(int num);
	public List<EventImageDto> getList(EventImageDto dto);
	public EventImageDto getData(int num);
}
