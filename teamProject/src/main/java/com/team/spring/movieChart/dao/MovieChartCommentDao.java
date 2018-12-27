package com.team.spring.movieChart.dao;

import java.util.List;

import com.team.spring.movieChart.dto.MovieChartCommentDto;

public interface MovieChartCommentDao {
	public List<MovieChartCommentDto> getList(int ref_group);
	public void delete(int num);
	public void insert(MovieChartCommentDto dto);
	public int getSequence();
	public void update(MovieChartCommentDto dto);
}
