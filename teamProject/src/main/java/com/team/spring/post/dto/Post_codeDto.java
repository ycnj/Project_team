package com.team.spring.post.dto;

public class Post_codeDto {
	private String address; //주소
	private String zipcode; //우편번호
	
	public Post_codeDto() {}


	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	};
	
	
}
