package com.team.spring.freeboard.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.spring.freeboard.dto.FreeBoardDto;


	
@Repository
public class FreeBoardDaoImpl implements FreeBoardDao{
	@Autowired
	private SqlSession session;

	@Override
	public int getCount(FreeBoardDto dto) {
		
		return session.selectOne("freeboard.getCount", dto);
	}

	@Override
	public List<FreeBoardDto> getList(FreeBoardDto dto) {
		
		return session.selectList("freeboard.getList", dto);
	}

	@Override
	public void insert(FreeBoardDto dto) {
		/*Object obj=dto;
        for (Field field : obj.getClass().getDeclaredFields()){
            field.setAccessible(true);
            Object value;
			try {
				value = field.get(obj);
				System.out.println(field.getName()+","+value);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}            
        }*/
		session.insert("freeboard.insert", dto);
	}

	@Override
	public FreeBoardDto getData2(FreeBoardDto dto) {		
		return session.selectOne("freeboard.getData2", dto);
	}

	@Override
	public void addViewCount(int num) {
		session.update("freeboard.addViewCount", num);
	}

	@Override
	public void delete(int num) {
		session.delete("freeboard.delete", num);
	}

	@Override
	public FreeBoardDto getData(int num) {		
		return session.selectOne("freeboard.getData", num);
	}

	@Override
	public void update(FreeBoardDto dto) {
		session.update("freeboard.update", dto);
	}

	@Override
	public void delete2(int num) {
		session.delete("freeboard.delete2", num);
		
	}
	
}

