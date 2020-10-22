package com.trashup.mapper;

import java.util.Map;

import org.springframework.stereotype.Component;

import com.trashup.domain.Board;

@Component
public interface BoardDao {
	
	void getBoardList (Map map);

	void getMyBoardList(Map map);

	void insertMember(Board board);

	void deleteBoard(Board board);

}
