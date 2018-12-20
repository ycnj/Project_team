package com.team.spring.rsch.dao;

import java.util.List;

import com.team.spring.rsch.vo.RschVO;


public interface RschDao {
	//게시글작성
	public void create(RschVO vo) throws Exception;
	//게시글 보기
	public RschVO read(int cd) throws Exception;
	//게시글 수정
	public void update(RschVO vo) throws Exception;
	//게시글 삭제
	public void delete(int cd) throws Exception;
	//게시글 전체
	public List<RschVO> listAll() throws Exception;

}
