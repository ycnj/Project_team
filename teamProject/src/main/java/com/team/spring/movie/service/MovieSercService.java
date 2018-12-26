package com.team.spring.movie.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.team.spring.movie.dto.MovieSercDto;

public interface MovieSercService {

	public void Mserc(ModelAndView mView, MovieSercDto dto);
}
