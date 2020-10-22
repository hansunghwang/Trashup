package com.trashup.service;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.trashup.domain.Member;
import com.trashup.mapper.MemberDao;

@Service
public class MemberServiceImp implements MemberService {
	
	Logger log = LoggerFactory.getLogger(MemberServiceImp.class);
	
	//싱글톤 객체 생성: 생성자 호출, 필드를 힙에 객체화, 메소드를 메로리에 적재
	//@Autowired: Spring에서 지원
	@Inject //자바에서 지원
	private MemberDao dao;
	
	@Override
	public void insertMember(Member member) {
		dao.insertMember(member);
	}

	@Override
	public int idDoubleCheck(String id) {
		return dao.idDoubleCheck(id);
	}

	@Override
	public Map<String, String> loginProc(Member member, HttpSession session) {
		
		Map<String, String> map = new HashMap<String, String>();
		
		Member m = dao.loginProc(member);
		
		if (m != null) {
			if(!m.getPw().equals(member.getPw())){
				map.put("preView", "login");
				map.put("stateRes", "pwFail");
			} else {
				session.setAttribute("sessId", m.getId());
				session.setAttribute("sessName", m.getName());
				session.setAttribute("sessNickname", m.getNickname());
				session.setAttribute("sessGrade", m.getGrade());
				session.setAttribute("sessThumbnail", map.get("thumbnail"));
			}
		} else {
			map.put("preView", "login");
			map.put("stateRes", "fail");
		}
		
		return map;
	}

}
