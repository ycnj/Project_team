package com.team.spring.movieChart.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import com.team.spring.movieChart.dto.MovieChartDto;
import com.team.spring.movieChart.dto.MovieChartLikeDto;

public interface MovieChartService {
	public void getList(HttpServletRequest request);
	public void removeFileInfo(int num, HttpServletRequest request, 
			HttpServletResponse response);
	public void saveFile(MovieChartDto dto, HttpServletRequest request);
	public void getFileData(ModelAndView mView, int num);
	public Map<String, Object> liketo(HttpServletRequest request);
}





