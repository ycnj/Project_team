package com.team.event.dto;

import org.springframework.web.multipart.MultipartFile;

public class EventDto {
	private int num;
	private String writer;
	private String caption;
	private String imagePath;
	private int startDate;
	private int endDate;
	private String regdate;
	
	private int startRowNum;
	private int endRowNum;
	
	public EventDto() {}
	
}
