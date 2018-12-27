package com.team.spring.movieChart.service;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.team.spring.movieChart.dao.MovieChartCommentDao;
import com.team.spring.movieChart.dao.MovieChartDao;
import com.team.spring.movieChart.dao.MovieChartLikeDao;
import com.team.spring.movieChart.dto.MovieChartCommentDto;
import com.team.spring.movieChart.dto.MovieChartDto;
import com.team.spring.movieChart.dto.MovieChartLikeDto;

@Service
public class MovieChartServiceImpl implements MovieChartService{
	@Autowired
	private MovieChartDao dao;
	@Autowired
	private MovieChartLikeDao likeDao;
	@Autowired
	private MovieChartCommentDao commentDao;
	
	//한 페이지에 나타낼 row 의 갯수 
	static final int PAGE_ROW_COUNT=8;
	//하단 디스플레이 페이지 갯수 
	static final int PAGE_DISPLAY_COUNT=5;
	
	@Override
	public void getList(HttpServletRequest request) {
		/*
		 *  request 에 검색 keyword 가 전달 될수도 있고 안될수도 있다.
		 *  1. 전달 안되는 경우 : home 에서 목록보기를 누른경우
		 *  2. 전달 되는 경우 : list.do 에서 검색어를 입력후 form 전송한
		 *     경우. 
		 *  3. 전달 되는 경우 : 이미 검색을 한 상태에서 페이지 링크를 
		 *     누른경우
		 */
		//검색과 관련된 파라미터를 읽어와 본다.
		String keyword=request.getParameter("keyword");
		String condition=request.getParameter("condition");
		MovieChartDto dto=new MovieChartDto();
		if(keyword != null) {//검색 키워드가 전달된 경우
			if(condition.equals("titlename")) {//제목+파일명 검색
				dto.setTitle(keyword);
				dto.setOrgFileName(keyword);
			}else if(condition.equals("title")) {//제목 검색
				dto.setTitle(keyword);
			}else if(condition.equals("writer")) {//작성자 검색
				dto.setId(keyword);
			}
			//request 에 검색 조건과 키워드 담기
			request.setAttribute("condition", condition);
			/*
			 *  검색 키워드에는 한글이 포함될 가능성이 있기 때문에
			 *  링크에 그대로 출력가능하도록 하기 위해 미리 인코딩을 해서
			 *  request 에 담아준다.
			 */
			String encodedKeyword=null;
			try {
				encodedKeyword=URLEncoder.encode(keyword, "utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			//인코딩된 키워드와 인코딩 안된 키워드를 모두 담는다.
			request.setAttribute("encodedKeyword", encodedKeyword);
			request.setAttribute("keyword", keyword);
		}		
		
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
		int totalRow=dao.getCount(dto);
		//전체 페이지의 갯수 구하기
		int totalPageCount=
				(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		//시작 페이지 번호
		int startPageNum=
			1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		//끝 페이지 번호
		int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
		//끝 페이지 번호가 잘못된 값이라면 
		if(totalPageCount < endPageNum){
			endPageNum=totalPageCount; //보정해준다. 
		}

		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		
		// startRowNum 과 endRowNum 에 해당하는 파일 목록을 select 해 온다.
		List<MovieChartDto> list=dao.getList(dto);		
		// view 페이지에서 필요한 값 request 에 담기 
		request.setAttribute("list", list);
		request.setAttribute("startPageNum", startPageNum);
		request.setAttribute("endPageNum", endPageNum);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("totalPageCount", totalPageCount);	
		request.setAttribute("totalRow", totalRow);
	}

	@Override
	public void removeFileInfo(int num, HttpServletRequest request, 
			HttpServletResponse response) {
		//1. 인자로 전달된 파일 번호를 이용해서 삭제할 파일의 정보를 얻어온다.
		MovieChartDto dto=dao.getData(num);
		//남의 파일을 삭제 할수 없도록 세션의 아이디와 파일의 작성자 비교
		String id=(String)request.getSession().getAttribute("id");
		if(!id.equals(dto.getId())) {
			//로그인된 아이디와 파일의 작성자가 다르면
			try {
				// 403 forbidden 에러 발생 시키기  
				response.sendError(HttpServletResponse.SC_FORBIDDEN);
			} catch (IOException e) {
				e.printStackTrace();
			}
			return; //메소드 종료 
		}
		
		//2. DB 에서 파일 정보 삭제
		dao.delete(num);
		//3. 파일 시스템에서 실제 파일 삭제 
		String path=request.getServletContext().getRealPath("/upload")+
				File.separator+dto.getSaveFileName();
		new File(path).delete();
	}

	@Override
	public void saveFile(MovieChartDto dto, HttpServletRequest request) {
		//파일을 저장할 폴더의 절대 경로를 얻어온다.
		String realPath=request.getSession()
				.getServletContext().getRealPath("/upload");
		//콘솔창에 테스트 출력
		System.out.println(realPath);
		
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
		String id=(String)request.getSession().getAttribute("id");
		dto.setId(id); //작성자
		dto.setOrgFileName(orgFileName);
		dto.setSaveFileName(saveFileName);
		dto.setFileSize(fileSize);
		//FileDao 객체를 이용해서 DB 에 저장하기
		dao.insert(dto);
	}

	@Override
	public void getFileData(ModelAndView mView, int num) {
		//번호에 해당하는 파일 정보를 얻어온다.
		MovieChartDto dto=dao.getData(num);
		//ModelAndView 객체에 담는다.
		mView.addObject("dto", dto);
	}

	@Override
	public Map<String, Object> liketo(HttpServletRequest request) {
		String id=(String)request.getSession().getAttribute("id");
		int movieInfoNum=Integer.parseInt(request.getParameter("movieInfoNum"));
		MovieChartLikeDto dto=new MovieChartLikeDto();
		dto.setId(id);
		dto.setMovieInfoNum(movieInfoNum);
		boolean check=likeDao.isLiked(dto);
		if(check) {			
			likeDao.updateCancel(dto);
		}else {
			likeDao.updateAdd(dto);
		}		
		//좋아요 개수 업데이트
		dao.addLikeCnt(movieInfoNum);
		MovieChartDto dto2=dao.getData(movieInfoNum);
		int liketo=dto2.getLiketo();
		Map<String, Object> map=new HashMap<>();
		map.put("liketo", liketo);
		
		return map;
	}

	@Override
	public void getData(HttpServletRequest request, int num, int no) {
		MovieChartDto dto=dao.getData(num);
		
		request.setAttribute("dto", dto);
		request.setAttribute("no", no);
	}

	@Override
	public void deleteComment(int num) {
		commentDao.delete(num);
	}

	@Override
	public void saveComment(HttpServletRequest request) {
		//댓글 작성자
		String id=(String)request.getSession().getAttribute("id");
		//댓글의 그룹번호(원글의 글번호)
		int ref_group=Integer.parseInt(request.getParameter("ref_group"));
		//댓글의 대상자 아이디
		String target_id=request.getParameter("target_id");
		//댓글의 내용
		String content=request.getParameter("content");
		//댓글 내에서의 그룹번호
		String comment_group=request.getParameter("comment_group");
		//저장할 댓글의 primary key 값을 미리 얻어낸다.
		int seq=commentDao.getSequence();
		//댓글 정보를 CafeCommentDto 객체에 담는다.
		MovieChartCommentDto dto=new MovieChartCommentDto();
		dto.setNum(seq);
		dto.setId(id);;
		dto.setRef_group(ref_group);
		dto.setTarget_id(target_id);
		dto.setContent(content);
		if(comment_group == null) {//원글의 댓글인 경우
			//댓글의 글번호가 댓글 내에서의 그룹번호
			dto.setComment_group(seq);
		}else {//댓글의 댓글인 경우
			//전달된 comment_group 번호를 새로 추가될 댓글의 그룹번호로 부여한다.
			dto.setComment_group(Integer.parseInt(comment_group));
		}
		//댓글 정보를 DB 에 저장한다.
		commentDao.insert(dto);
		
	}

	@Override
	public void updateComment(MovieChartCommentDto dto) {
		commentDao.update(dto);
		
	}
	
}

