package com.trashup.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.trashup.domain.Board;

public interface BoardService {

	Map getBoardList(String keyword);

	Map getMyBoardList(HttpSession session, HttpServletRequest request);

	void insertBoard(Board board);

	void deleteBoard(Board board);
	

}
