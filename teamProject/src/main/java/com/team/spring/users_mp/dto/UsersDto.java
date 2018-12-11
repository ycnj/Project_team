package com.team.spring.users_mp.dto;

public class UsersDto {

	private String name; //이름
	private String rrn; //생년월일
	private String id; //회원아이디
	private String pwdl; //회원비밀번호
	private String email;//회원이메일
	private int phon; //핸드폰
	private String addr; //주소
	private String gender; //성별
	private int gubun; //구분
	private String date; //가입일
	
	public UsersDto() {}

	public UsersDto(String name, String rrn, String id, String pwdl, String email, int phon, String addr, String gender,
			int gubun, String date) {
		super();
		this.name = name;
		this.rrn = rrn;
		this.id = id;
		this.pwdl = pwdl;
		this.email = email;
		this.phon = phon;
		this.addr = addr;
		this.gender = gender;
		this.gubun = gubun;
		this.date = date;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRrn() {
		return rrn;
	}

	public void setRrn(String rrn) {
		this.rrn = rrn;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwdl() {
		return pwdl;
	}

	public void setPwdl(String pwdl) {
		this.pwdl = pwdl;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getPhon() {
		return phon;
	}

	public void setPhon(int phon) {
		this.phon = phon;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getGubun() {
		return gubun;
	}

	public void setGubun(int gubun) {
		this.gubun = gubun;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
	
}
