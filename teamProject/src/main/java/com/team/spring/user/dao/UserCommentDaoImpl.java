package com.team.spring.user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.spring.user.dto.UserCommentDto;

@Repository
public class UserCommentDaoImpl implements UserCommentDao{
	@Autowired
	private SqlSession session;

	@Override
	public List<UserCommentDto> getList(int ref_group) {
		//ref_group 번호를 이용해서 댓글 목록을 select 해서 리턴해준다. 
		return session.selectList("UserComment.getList", ref_group);
	}

	@Override
	public void delete(int num) {
		session.delete("UserComment.delete", num);
	}

	@Override
	public void insert(UserCommentDto dto) {
		//새 댓글 저장하기
		session.insert("UserComment.insert", dto);
	}

	@Override
	public int getSequence() {
		//새로 등록될 댓글의 글번호를 리턴해주기 
		return session.selectOne("UserComment.getSequence");
	}

	@Override
	public void update(UserCommentDto dto) {
		//댓글 수정하기
		session.update("UserComment.update", dto);
	}
	
}













