package com.trashup.service;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.trashup.domain.Board;
import com.trashup.mapper.BoardDao;

@Service
public class BoardServiceImp implements BoardService {
	
	Logger log = LoggerFactory.getLogger(BoardServiceImp.class);
	
	@Inject
	private BoardDao dao;
	
	@Override
	public Map getBoardList(String keyword) {
		Map map = new HashMap();
		map.put("keyword", keyword);
		dao.getBoardList(map);
		return map;
	}
	
	@Override
	public Map getMyBoardList(HttpSession session, HttpServletRequest request) {
		
		String seqNum = "0";
		if(request.getParameter("ref") != null) seqNum = request.getParameter("ref");
		
		String keyword = "";
		
		if(request.getParameter("keyword") !=  null) {
			keyword = request.getParameter("keyword");
			request.setAttribute("keyword", keyword);
		}
		
		session = request.getSession();
		Map map = new HashMap();
		
		map.put("id", session.getAttribute("sessId"));
		map.put("seqNum", seqNum);
		map.put("keyword", keyword);
		
		dao.getMyBoardList(map);
		return map;
	}

	@Override
	public void insertBoard(Board board) {
		dao.insertMember(board);
	}

	@Override
	public void deleteBoard(Board board) {
		dao.deleteBoard(board);
	}

	

}
