package com.team.spring.users.dao;

import com.team.spring.users.dto.UsersResDto;

/* UsersDaoImpl 클래스가 구현할 인터페이스 */
public interface UsersResDao {
	//예매 내역 불러오기
	public UsersResDto getData(String id);
	//예매 내역 넣기
	public void insert(UsersResDto dto);
	//누적금액 불러오기
	public int getSumPrice(String id);
	//예매 취소
	public void cancelRes(UsersResDto dto);

}














