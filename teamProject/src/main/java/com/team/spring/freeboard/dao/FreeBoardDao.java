package com.team.spring.freeboard.dao;

import java.util.List;

import com.team.spring.freeboard.dto.FreeBoardDto;


public interface FreeBoardDao {
	public int getCount(FreeBoardDto dto);
	public List<FreeBoardDto> getList(FreeBoardDto dto);
	public void insert(FreeBoardDto dto);
	public FreeBoardDto getData2(FreeBoardDto dto);
	public void addViewCount(int num);
	public void delete(int num);
	public FreeBoardDto getData(int num);
	public void update(FreeBoardDto dto);
}
