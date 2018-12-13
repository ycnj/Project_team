package com.team.spring.movieChart.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.spring.movieChart.dto.MovieChartDto;

@Repository
public class MovieChartDaoImpl implements MovieChartDao{
	@Autowired
	private SqlSession session;

	@Override
	public int getCount(MovieChartDto dto) {
		return session.selectOne("movieChart.getCount", dto);
	}

	@Override
	public List<MovieChartDto> getList(MovieChartDto dto) {
		
		return session.selectList("movieChart.getList", dto);
	}

	@Override
	public void delete(int num) {
		session.delete("movieChart.delete", num);
	}

	@Override
	public MovieChartDto getData(int num) {
		
		return session.selectOne("movieChart.getData", num);
	}

	@Override
	public void insert(MovieChartDto dto) {
		session.insert("movieChart.insert", dto);
	}
	
}




