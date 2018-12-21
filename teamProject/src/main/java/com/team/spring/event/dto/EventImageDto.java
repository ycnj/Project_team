package com.team.spring.event.dto;

import org.springframework.web.multipart.MultipartFile;

public class EventImageDto {
	private int num;
	private int ref_group; //Detail page의 테이블 번호 그루핑.
	private String orgFileName;
	private String saveFileName;
	private long fileSize;
	private String regdate;
	private MultipartFile file;
	
	public EventImageDto() {}

	public EventImageDto(int num, int ref_group, String orgFileName, String saveFileName, long fileSize, String regdate,
			MultipartFile file) {
		super();
		this.num = num;
		this.ref_group = ref_group;
		this.orgFileName = orgFileName;
		this.saveFileName = saveFileName;
		this.fileSize = fileSize;
		this.regdate = regdate;
		this.file = file;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getRef_group() {
		return ref_group;
	}

	public void setRef_group(int ref_group) {
		this.ref_group = ref_group;
	}

	public String getOrgFileName() {
		return orgFileName;
	}

	public void setOrgFileName(String orgFileName) {
		this.orgFileName = orgFileName;
	}

	public String getSaveFileName() {
		return saveFileName;
	}

	public void setSaveFileName(String saveFileName) {
		this.saveFileName = saveFileName;
	}

	public long getFileSize() {
		return fileSize;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}
		
}
