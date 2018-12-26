package com.team.spring.rsch.dao;

import java.util.List;

import com.team.spring.rsch.dto.RschListDto;






public interface RschDao {
	public int getCount(RschListDto dto);
	public List<RschListDto> getList(RschListDto dto);
	public void insert(RschListDto dto);
	public RschListDto getData(RschListDto dto);
	public void addViewCount(int cd);
	public void delete(int cd);
	public RschListDto getData(int cd);
	public void update(RschListDto dto);

}
