package com.team.spring.ask.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.spring.ask.dto.AskDto;

@Repository
public class AskDaoImpl implements AskDao{
	@Autowired
	private SqlSession session;

	@Override
	public int getCount(AskDto dto) {
		
		return session.selectOne("ask.getCount", dto);
	}

	@Override
	public List<AskDto> getList(AskDto dto) {
		
		return session.selectList("ask.getList", dto);
	}

	@Override
	public void insert(AskDto dto) {
	
		session.insert("ask.insert", dto);
	}

	@Override
	public AskDto getData(AskDto dto) {
		
		return session.selectOne("ask.getData2", dto);
	}

	@Override
	public void addViewCount(int num) {
		session.update("ask.addViewCount", num);
		
	}

	@Override
	public void delete(int num) {
		session.delete("ask.delete", num);
	}

	@Override
	public AskDto getData(int num) {
		
		return session.selectOne("ask.getData", num);
	}

	@Override
	public void update(AskDto dto) {
		session.update("ask.update", dto);
		
	}

}











