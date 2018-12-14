package com.team.spring.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.spring.rsch.dto.rschWriteDto;

@Repository
public class rschWriteDaoImpl implements rschWriteDao {
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<rschWriteDto> getList(int cd) {
		
		return session.selectList("rschWrite.getList",cd);
	}	
	
	@Override
	public void delete(int cd) {
		session.delete("rschWirte.delete", cd);
	}
	@Override
	public void insert(rschWriteDto dto) {
		session.insert("rschWrite.insert", dto);
	}
	@Override
	public int getSequence() {
		return session.selectOne("rschWrite.getSequence");
	}
	@Override
	public void update(rschWriteDto dto) {
		session.update("rschWrite.update", dto);
	}


}
