package com.team.spring.file.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.spring.file.dto.FileDto;

@Repository
public class FileDaoImpl implements FileDao{
	@Autowired
	private SqlSession session;

	@Override
	public int getCount(FileDto dto) {
		
		return session.selectOne("file.getCount", dto);
	}

	@Override
	public List<FileDto> getList(FileDto dto) {
		
		return session.selectList("file.getList", dto);
	}

	@Override
	public void delete(int num) {
		session.delete("file.delete", num);
	}

	@Override
	public FileDto getData(int num) {
		
		return session.selectOne("file.getData", num);
	}

	@Override
	public void insert(FileDto dto) {
		session.insert("file.insert", dto);
	}

	@Override
	public void addDownCount(int num) {
		session.update("file.addDownCount", num);
	}
	
}











