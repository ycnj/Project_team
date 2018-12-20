package com.team.spring.movieChart.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.spring.movieChart.dto.MovieChartLikeDto;

@Repository
public class MovieChartLikeDaoImpl implements MovieChartLikeDao{
	@Autowired
	private SqlSession session;

	//좋아요 눌렀는지 확인하는 메소드
	public boolean isLiked(MovieChartLikeDto dto) {
		int like_check=session.selectOne("movieChart.isLiked", dto);
		if (like_check == 1) {
			return true;
		} else {
			return false;
		}
	}	
	//좋아요 -1
	public boolean updateCancel(MovieChartLikeDto dto) {
		int flag=session.insert("movieChart.like_cancel", dto);

		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}
	//좋아요 +1
	public boolean updateAdd(MovieChartLikeDto dto) {
		int flag=session.insert("movieChart.like_add", dto);
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}

	
}




