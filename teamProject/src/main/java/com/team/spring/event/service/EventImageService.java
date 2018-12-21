package com.team.spring.event.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team.spring.event.dto.EventImageDto;

public interface EventImageService {
	public void saveImage(EventImageDto dto, HttpServletRequest request);
	public void deleteImage(int num,  HttpServletRequest request, HttpServletResponse response);
}
