package com.team.spring.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.spring.rsch.dto.rschListDto;

@Repository
public class rschListDaoImpl implements rschListDao {
	@Autowired
	private SqlSession session;
	
	@Override
	public int getCount(rschListDto dto) {
		return session.selectOne("rsch.getCount", dto);
	}
	
	@Override
	public List<rschListDto> getList(rschListDto dto) {
		
		return session.selectList("rsch.getList", dto);
	}
	
	@Override
	public rschListDto getData(rschListDto dto) {
		return session.selectOne("rsch.getData2", dto);
	}
	@Override
	public void addViewCount(int cd) {
		session.update("rsch.addViewCount", cd);
	}

	@Override
	public rschListDto getData(int cd) {
		
		return session.selectOne("rsch.getData", cd);
	}

	@Override
	public void update(rschListDto dto) {
		session.update("rschList.update", dto);
		
	}

}
