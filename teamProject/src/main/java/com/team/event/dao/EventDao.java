package com.team.event.dao;

import java.util.List;

import com.team.event.dto.EventDto;

public interface EventDao {
	public List<EventDto> getList(EventDto dto);
	public void insert(EventDto dto);
}
