package com.team.event.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.event.dto.EventDto;

@Repository
public class EventDaoImpl implements EventDao{
	@Autowired
	private SqlSession session;
	
	@Override
	public List<EventDto> getList(EventDto dto) {		
		return session.selectList("event.getList", dto);
	}

	@Override
	public void insert(EventDto dto) {
		session.insert("event.insert", dto);
	}

}
