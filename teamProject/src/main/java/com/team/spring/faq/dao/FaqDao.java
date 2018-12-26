package com.team.spring.faq.dao;

import java.util.List;

import com.team.spring.faq.dto.FaqDto;

public interface FaqDao {
	public int getCount(FaqDto dto);
	public List<FaqDto> getList(FaqDto dto);
	public void insert(FaqDto dto);
	public FaqDto getData(FaqDto dto);
	public void addViewCount(int num);
	public void delete(int num);
	public FaqDto getData(int num);
	public void update(FaqDto dto);


}















