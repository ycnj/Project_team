package com.team.spring.dao;

import java.util.List;

import com.team.spring.rsch.dto.rschWriteDto;

public interface rschWriteDao {
	public List<rschWriteDto> getList(int cd);
	public void delete(int cd);
	public void insert(rschWriteDto dto);
	public int getSequence();
	public void update(rschWriteDto dto);

}
