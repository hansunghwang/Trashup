package service.board;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ServiceBoard;
import dao.BoardDao;
import dto.Board;

public class BoardDetail implements ServiceBoard {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		BoardDao boardDao = new BoardDao();
		Board board = boardDao.getBoardContent(request.getParameter("seqNum"));
		request.setAttribute("boardCon", board);
	}
}
