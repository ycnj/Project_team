package com.team.spring.rsch.dto;

public class rschJoinListDto {
	private int cd;
	private String comm;
	private int cnt;
	
	public rschJoinListDto() {}
	public rschJoinListDto(int cd, String comm, int cnt) {
		super();
		this.cd = cd;
		this.comm = comm;
		this.cnt = cnt;
	}
	public int getCd() {
		return cd;
	}
	public void SetCd(int cd) {
		this.cd = cd;
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
}
