package com.team.spring.movieChart.dao;

import com.team.spring.movieChart.dto.MovieChartLikeDto;

public interface MovieChartLikeDao {
	public boolean isLiked(MovieChartLikeDto dto);
	public boolean updateCancel(MovieChartLikeDto dto);
	public boolean updateAdd(MovieChartLikeDto dto);
}



