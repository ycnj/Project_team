package com.team.spring.file.dao;

import java.util.List;

import com.team.spring.file.dto.FileDto;

public interface FileDao {
	//FileDto 에 들어있는 검색 키워드에 부합하는 전체 자료의 갯수를 리턴하는 메소드 
	public int getCount(FileDto dto);
	//FileDto 에 들어있는 검색 키워드에 부합하는 자료 목록중에서
	//startRowNum 과 endRowNum 에 해당하는 목록을 리턴하는 메소드 
	public List<FileDto> getList(FileDto dto);
	//파일 번호를 이용해서 파일 정보를 삭제하는 메소드
	public void delete(int num);
	//파일 정보를 리턴하는 메소드
	public FileDto getData(int num);
	//업로드된 파일 정보를 저장하는 메소드
	public void insert(FileDto dto);
	//파일 다운로드 횟수 증가 시키는 메소드
	public void addDownCount(int num);
}











