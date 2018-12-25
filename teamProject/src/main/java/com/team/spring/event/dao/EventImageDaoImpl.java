package com.team.spring.event.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.spring.event.dto.EventDto;
import com.team.spring.event.dto.EventImageDto;

@Repository
public class EventImageDaoImpl implements EventImageDao{
	@Autowired
	private SqlSession session;

	@Override
	public void insert(EventImageDto dto) {
		session.insert("eventImage.insert", dto);
	}

	@Override
	public void delete(int num) {
		session.delete("eventImage.delete", num);
	}

	@Override
	public List<EventImageDto> getList(EventImageDto dto) {
		return session.selectList("eventImage.getList", dto);
	}

	@Override
	public EventImageDto getData(int num) {
		return session.selectOne("eventImage.getData", num);
	}
	
}
