package com.team.spring.rsch.dao;

import java.util.List;


import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.spring.rsch.vo.RschVO;

@Repository
public class RschDaoImpl implements RschDao {
	
	@Autowired
	SqlSession SqlSession;

	@Override
	public void create(RschVO vo) throws Exception {
		SqlSession.insert("rsch.insert", vo);
		
	}

	@Override
	public RschVO read(int cd) throws Exception {
		return SqlSession.selectOne("rsch.view",cd);
	}

	@Override
	public void update(RschVO vo) throws Exception {
		SqlSession.update("rsch.updateArticle", vo);
		
	}

	@Override
	public void delete(int cd) throws Exception {
		SqlSession.delete("rsch.deleteArticle", cd);
		
	}

	@Override
	public List<RschVO> listAll() throws Exception {
		return SqlSession.selectList("rsch.listAll");
	}
	
}

