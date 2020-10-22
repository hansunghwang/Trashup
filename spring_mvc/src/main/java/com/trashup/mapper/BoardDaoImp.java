package com.trashup.mapper;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.trashup.domain.Board;



@Repository
public class BoardDaoImp implements BoardDao {
	
	Logger log = LoggerFactory.getLogger(BoardDaoImp.class);
	Connection conn = DB.getConnect();
	CallableStatement cstmt= null;
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "mapper.BoardMapper";

	@Override
	public void getBoardList(Map map) {	
		sqlSession.selectOne(namespace+".getBoardList", map);
	}
	
	@Override
	public void getMyBoardList(Map map) {
		sqlSession.selectOne(namespace+".getMyBoardList", map);
	}

	@Override
	public void insertMember(Board board) {
		sqlSession.selectOne(namespace+".insertBoard", board);
		
	}

	@Override
	public void deleteBoard(Board board) {
		sqlSession.selectOne(namespace+".deleteBoard", board);
		
	}


	
}
