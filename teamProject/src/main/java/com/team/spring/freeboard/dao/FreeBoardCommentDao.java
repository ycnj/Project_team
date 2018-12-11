package com.team.spring.freeboard.dao;

import java.util.List;

import com.team.spring.freeboard.dto.FreeBoardCommentDto;

public interface FreeBoardCommentDao {
	public List<FreeBoardCommentDto> getList(int ref_group);
	public void delete(int num);
	public void insert(FreeBoardCommentDto dto);
	public int 	getSequence();
	public void update(FreeBoardCommentDto dto);
}
