package com.team.spring.event.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.spring.event.dto.EventDto;

@Repository
public class EventDaoImpl implements EventDao{
	@Autowired
	private SqlSession session;
	
	@Override
	public int getCount(EventDto dto) {
		return session.selectOne("event.getCount", dto);
	}
	
	@Override
	public List<EventDto> getList(EventDto dto) {		
		return session.selectList("event.getList", dto);
	}

	@Override
	public void insert(EventDto dto) {
		session.insert("event.insert", dto);
	}

	@Override
	public void addViewCount(int num) {
		session.update("event.addViewCount", num);
	}

	@Override
	public void delete(int num) {
		session.delete("event.delete", num);		
	}

	@Override
	public void update(EventDto dto) {
		session.update("event.update", dto);		
	}

	@Override
	public EventDto getData(int num) {
		return session.selectOne("event.getData", num);
	}

}
