package com.team.spring.user.dao;

import java.util.List;

import com.team.spring.user.dto.UserCommentDto;

public interface UserCommentDao {
	public List<UserCommentDto> getList(int ref_group);
	public void delete(int num);
	public void insert(UserCommentDto dto);
	public int getSequence();
	public void update(UserCommentDto dto);
}
