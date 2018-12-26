package com.team.spring.rsch.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.spring.rsch.dto.RschListDto;

<<<<<<< HEAD
=======

@Repository
>>>>>>> branch 'kim1' of https://github.com/ycnj/Project_team.git
public class RschDaoImpl implements RschDao {
	@Autowired
	private SqlSession session;


	@Override
	public int getCount(RschListDto dto) {
		return session.selectOne("rsch.getCount", dto);
	}

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
	public void addViewCount(int cd) {
		session.update("cafe.addViewCount", cd);
		
	}

	@Override
	public void delete(int cd) {
		session.delete("cafe.delete", cd);
	}

	@Override
	public RschListDto getData(int cd) {
		return session.selectOne("cafe.getData", cd);
		}



	@Override
	public void update(RschListDto dto) {
		session.update("rsch.update", dto);
		}

}
