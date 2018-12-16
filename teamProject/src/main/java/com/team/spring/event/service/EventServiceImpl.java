package com.team.spring.event.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.team.spring.event.dto.EventDto;
import com.team.spring.event.dao.EventDao;

@Service
public class EventServiceImpl implements EventService {

	@Autowired
	private EventDao eventDao;
	static final int PAGE_ROW_COUNT=5;
	//하단 디스플레이 페이지 갯수 
	static final int PAGE_DISPLAY_COUNT=3;	
	
	@Override
	public void getList(HttpServletRequest request) {
		EventDto dto=new EventDto();
		
			//보여줄 페이지의 번호
				int pageNum=1;
				//보여줄 페이지의 번호가 파라미터로 전달되는지 읽어와 본다.	
				String strPageNum=request.getParameter("pageNum");
				if(strPageNum != null){//페이지 번호가 파라미터로 넘어온다면
					//페이지 번호를 설정한다.
					pageNum=Integer.parseInt(strPageNum);
				}
				//보여줄 페이지 데이터의 시작 ResultSet row 번호
				int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
				//보여줄 페이지 데이터의 끝 ResultSet row 번호
				int endRowNum=pageNum*PAGE_ROW_COUNT;
				
				//전체 row 의 갯수를 읽어온다.
				int totalRow=eventDao.getCount(dto);
				//전체 페이지의 갯수 구하기
				int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
				//시작 페이지 번호
				int startPageNum=
					1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
				//끝 페이지 번호
				int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
				//끝 페이지 번호가 잘못된 값이라면 
				if(totalPageCount < endPageNum){
					endPageNum=totalPageCount; //보정해준다. 
				}
				// startRowNum 과 endRowNum 을 EventDto 객체에 담고 
				dto.setStartRowNum(startRowNum);
				dto.setEndRowNum(endRowNum);
		List<EventDto> list=eventDao.getList(dto);	
		request.setAttribute("list", list);		
		request.setAttribute("startPageNum", startPageNum);
		request.setAttribute("endPageNum", endPageNum);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("totalPageCount", totalPageCount);	
		//전체 글의 갯수도 request 에 담는다.
		request.setAttribute("totalRow", totalRow);	
	}

	@Override
	public void saveContent(EventDto dto) {
		eventDao.insert(dto);
	}

	@Override
	public void getDetail(HttpServletRequest request) {
		int num=Integer.parseInt(request.getParameter("num"));
		EventDto dto=new EventDto();
		dto.setNum(num);
		
		EventDto resultDto=eventDao.getData(dto);
		eventDao.addViewCount(num);
		request.setAttribute("dto", resultDto);
	}

	@Override
	public void deleteContent(int num) {
		eventDao.delete(num);
	}

	@Override
	public void getUpdateData(ModelAndView mView, int num) {
		EventDto dto=eventDao.getData(num);
		mView.addObject("dto", dto);
	}

	@Override
	public void updateContent(EventDto dto) {
		eventDao.update(dto);
	}

}
