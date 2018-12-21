package com.team.spring.event.service;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.team.spring.event.dao.EventImageDao;
import com.team.spring.event.dto.EventImageDto;

@Service
public class EventImageServiceImpl implements EventImageService {

	@Autowired
	private EventImageDao eventImageDao;

	@Override
	public void saveImage(EventImageDto dto, HttpServletRequest request) {
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
		dto.setOrgFileName(orgFileName);
		dto.setSaveFileName(saveFileName);
		dto.setFileSize(fileSize);
		eventImageDao.insert(dto);
	}

	@Override
	public void deleteImage(int num, HttpServletRequest request, HttpServletResponse response) {
		EventImageDto dto=eventImageDao.getData(num);
		eventImageDao.delete(num);
		String path=request.getServletContext().getRealPath("upload")+
				File.separator+dto.getSaveFileName();
		new File(path).delete();
	}

}
