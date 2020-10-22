package com.trashup.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.trashup.domain.Member;

public interface MemberService {
	int idDoubleCheck(String id);

	void insertMember(Member member);

	Map<String, String> loginProc(Member member, HttpSession session);

}
