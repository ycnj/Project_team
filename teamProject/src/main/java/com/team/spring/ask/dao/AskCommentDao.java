package com.team.spring.ask.dao;

import java.util.List;

import com.team.spring.ask.dto.AskCommentDto;

public interface AskCommentDao {
	public List<AskCommentDto> getList(int ref_group);
	public void delete(int num);
	public void insert(AskCommentDto dto);
	public int getSequence();
	public void update(AskCommentDto dto);
}
