package com.team.spring.event.service;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.team.spring.event.dao.EventDao;
import com.team.spring.event.dto.EventDto;

@Service
public class EventServiceImpl implements EventService {

	@Autowired
	private EventDao eventDao;
	static final int PAGE_ROW_COUNT=8;
	//하단 디스플레이 페이지 갯수 
	static final int PAGE_DISPLAY_COUNT=3;	
	//목록 출력 서비스
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
	// 상세 정보 서비스
	@Override
	public void getDetail(HttpServletRequest request) {
		int num=Integer.parseInt(request.getParameter("num"));
		EventDto dto=new EventDto();
		dto.setNum(num);
		
		EventDto resultDto=eventDao.getData(num);
		eventDao.addViewCount(num);
		request.setAttribute("dto", resultDto);
	}
	// 컨텐츠 삭제 서비스
	@Override
	public void deleteContent(int num, HttpServletRequest request,
			HttpServletResponse response) {
		EventDto dto=eventDao.getData(num);
		String id=(String)request.getSession().getAttribute("id");
		if(!id.equals(dto.getWriter())) {
			try {
				response.sendError(HttpServletResponse.SC_FORBIDDEN);
			}catch (Exception e) {
				e.printStackTrace();
			}
			return;
		}
		eventDao.delete(num);
		String path=request.getServletContext().getRealPath("upload")+
				File.separator+dto.getSaveFileName();
		new File(path).delete();
	}
	// 컨텐츠 수정 서비스
	@Override
	public void updateContent(EventDto dto) {
		eventDao.update(dto);
	}
	// 컨텐츠 저장 서비스
	@Override
	public void saveContent(EventDto dto, HttpServletRequest request) {
		//파일을 저장할 폴더의 절대 경로를 얻어온다.
		String realPath=request.getSession()
				.getServletContext().getRealPath("/upload");		
		MultipartFile mFile=dto.getFile();
		//원본 파일명
		String orgFileName=mFile.getOriginalFilename();
		//파일 사이즈
		long fileSize=mFile.getSize();
		//저장할 파일의 상세 경로
		String filePath=realPath+File.separator;
		//디렉토리를 만들 파일 객체 생성
		File file=new File(filePath);
		if(!file.exists()){//디렉토리가 존재하지 않는다면
			file.mkdir();//디렉토리를 만든다.
		}
		//파일 시스템에 저장할 파일명을 만든다. (겹치치 않게)
		String saveFileName=System.currentTimeMillis()+orgFileName;
		try{
			//upload 폴더에 파일을 저장한다.
			mFile.transferTo(new File(filePath+saveFileName));
		}catch(Exception e){
			e.printStackTrace();
		}
		String id="ragu";//(String)request.getSession().getAttribute("id");
		dto.setWriter(id);
		dto.setOrgFileName(orgFileName);
		dto.setSaveFileName(saveFileName);
		dto.setFileSize(fileSize);
		//FileDao 객체를 이용해서 DB 에 저장하기
		eventDao.insert(dto);	
		
	}
	// 조회수 증가 서비스
	@Override
	public void addViewCount(int num) {
		eventDao.addViewCount(num);
	}

}
