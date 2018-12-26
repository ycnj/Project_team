package com.team.spring.rsch.dao;

import java.util.List;



import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.spring.rsch.dto.RschListDto;


@Repository
public class RschDaoImpl implements RschDao {
	
	@Autowired
	SqlSession session;

	@Override
	public List<RschListDto> getList(RschListDto dto) {
		return session.selectList("rsch.getList", dto);
	}

	@Override
	public void insert(RschListDto dto) {
		session.insert("rsch.insert", dto);
		
	}

	@Override
	public RschListDto getData(RschListDto dto) {
		return session.selectOne("rsch.getData2", dto);
	}

	@Override
	public void delete(int cd) {
		session.delete("rsch.delete", cd);
		
	}

	@Override
	public RschListDto getData(int cd) {
		return session.selectOne("rsch.getData", cd);
	}

	@Override
	public void update(RschListDto dto) {
		session.update("rsch.update", dto);
		
	}
}
	

