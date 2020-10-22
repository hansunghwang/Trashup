package com.trashup.mapper;

import org.springframework.stereotype.Component;

import com.trashup.domain.Member;

@Component
public interface MemberDao {
	
	//아이디 중복체크
	int idDoubleCheck(String id);
	
	//회원등록
	void insertMember(Member member);
	
	//로그인
	Member loginProc(Member member);
	
	//test용
	String getTime();


}
