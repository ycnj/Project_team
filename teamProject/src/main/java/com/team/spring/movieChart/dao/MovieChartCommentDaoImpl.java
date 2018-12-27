package com.team.spring.movieChart.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.spring.movieChart.dto.MovieChartCommentDto;

@Repository
public class MovieChartCommentDaoImpl implements MovieChartCommentDao{
	@Autowired
	private SqlSession session;

	@Override
	public List<MovieChartCommentDto> getList(int ref_group) {		
		return session.selectList("cafeComment.getList", ref_group);
	}

	@Override
	public void delete(int num) {
		session.update("cafeComment.delete", num);
	}

	@Override
	public void insert(MovieChartCommentDto dto) {
		session.insert("cafeComment.insert", dto);		
	}

	@Override
	public int getSequence() {
		return session.selectOne("cafeComment.getSequence");
	}

	@Override
	public void update(MovieChartCommentDto dto) {
		session.update("cafeComment.update", dto);
	}
	
	
}
