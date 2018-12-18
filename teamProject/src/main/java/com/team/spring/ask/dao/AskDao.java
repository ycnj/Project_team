package com.team.spring.ask.dao;

import java.util.List;

import com.team.spring.ask.dto.AskDto;

public interface AskDao {
	public int getCount(AskDto dto);
	public List<AskDto> getList(AskDto dto);
	public void insert(AskDto dto);
	public AskDto getData(AskDto dto);
	public void addViewCount(int num);
	public void delete(int num);
	public AskDto getData(int num);
	public void update(AskDto dto);


}















