package com.team.spring.rsch.service;

import java.util.List;


import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;

import com.team.spring.rsch.dao.RschDao;
import com.team.spring.rsch.vo.RschVO;


public class RschServiceImpl implements RschService {
	@Autowired
	RschDao rschDao;

	@Override
	public void create(RschVO vo) throws Exception {
		String title = vo.getTitle();
		String comm = vo.getComm();
		int cnt = vo.SetCnt();
		
		title = title.replace("<", "&lt;");
		title = title.replace(">", "&gt;");
		comm = comm.replace("<", "&lt;");
		comm = comm.replace(">", "&gt;");
		
		title = title.replace("  ", "&nbsp;&nbsp;");
		comm = comm.replace("  ", "&nbsp;&nbsp;");
	}

	@Override
	public RschVO read(int cd) throws Exception {
		return rschDao.read(cd);
	}

	@Override
	public void update(RschVO vo) throws Exception {
		rschDao.update(vo);
		
	}

	@Override
	public void delete(int cd) throws Exception {
		rschDao.delete(cd);
	}

	@Override
	public List<RschVO> listAll() throws Exception {
		return rschDao.listAll();
	}

}
