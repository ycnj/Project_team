package com.team.spring.rsch.dto;

public class RschListDto {
	private int cd;
	private String title;
	private int sdate;
	private int edate;
	private String use;
	private int rdate;
	private String comm;
	private int cnt;
	//페이징 처리를 위한 필드
		private int startRowNum;
		private int endRowNum;
		//이전글, 다음글의 글번호를 담을 필드
		private int prevNum;
		private int nextNum;

	
	public RschListDto() {}
	public RschListDto(int cd, String title, int sdate, int edate, String use, int rdate, String comm, int cnt, int startRowNum,
			int endRowNum, int prevNum, int nextNum) {
		
		super();
		this.cd = cd;
		this.title = title;
		this.sdate = sdate;
		this.edate = edate;
		this.use = use;
		this.rdate = rdate;
		this.comm = comm;
		this.cnt = cnt;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
		this.prevNum = prevNum;
		this.nextNum = nextNum;

	}
	public int getCd() {
		return cd;
	}
	public void setCd(int cd) {
		this.cd = cd;		
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getSdate() {
		return sdate;
	}
	public void setSdate(int sdate) {
		this.sdate = sdate;
	}
	public int getEdate() {
		return edate;
	}
	public void setEdate(int edate) {
		this.edate = edate;
	}
	public String getUse() {
		return use;
	}
	public void setUse(String use) {
		this.use = use;
	}
	public int getRdate() {
		return rdate;
	}
	public void setRdate(int rdate) {
		this.rdate = rdate;
	}
	public String getComm() {
		return comm;
	}
	public void SetComn(String comm) {
		this.comm = comm;
	}
	public int getCnt() {
		return cnt;
	}
	public void SetCnt(int cnt) {
		this.cnt = cnt;
		
	}
	public int getStartRowNum() {
		return startRowNum;
	}
	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}
	public int getEndRowNum() {
		return endRowNum;
	}
	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}
	public int getPrevNum() {
		return prevNum;
	}
	public void setPrevNum(int prevNum) {
		this.prevNum = prevNum;
	}
	public int getNextNum() {
		return nextNum;
	}
	public void setNextNum(int nextNum) {
		this.nextNum = nextNum;
	}

	
}

