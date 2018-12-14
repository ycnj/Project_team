package com.team.spring.dao;

import java.util.List;

import com.team.spring.rsch.dto.rschListDto;

public interface rschListDao {
	public int getCount(rschListDto dto);
	public List<rschListDto> getList(rschListDto dto);
	public rschListDto getData(rschListDto dto);
	public void addViewCount(int cd);
	public rschListDto getData(int cd);
	public void update(rschListDto dto);
}
