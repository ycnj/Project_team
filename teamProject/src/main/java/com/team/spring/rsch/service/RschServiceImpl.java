package com.team.spring.rsch.service;

import java.util.List;



import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.team.spring.rsch.dao.RschDao;
import com.team.spring.rsch.dto.RschListDto;


@Service
public class RschServiceImpl implements RschService {
	@Autowired
	RschDao rschDao;

	@Override
	public void getList(HttpServletRequest request) {
		RschListDto dto=new RschListDto();
		List<RschListDto> list=rschDao.getList(dto);
		
	}

	@Override
	public void saveContent(RschListDto dto) {
		rschDao.insert(dto);
		
	}

	@Override
	public void getDetail(HttpServletRequest request) {
		int cd=Integer.parseInt(request.getParameter("cd"));
		RschListDto dto=new RschListDto();
		dto.setCd(cd);
		RschListDto resultDto=rschDao.getData(dto);
		
	}

	@Override
	public void deleteContent(int cd) {
		rschDao.delete(cd);
		
	}

	@Override
	public void getUpdateData(ModelAndView mView, int num) {
		//글 수정 폼에 필요한 데이터를 얻어온다.
				RschListDto dto=rschDao.getData(num);
				//ModelAndView 객체에 dto를 담아준다. 
				mView.addObject("dto", dto);
		
	}

	@Override
	public void updateContent(RschListDto dto) {
		rschDao.update(dto);
		
	}
}

