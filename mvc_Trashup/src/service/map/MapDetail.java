package service.map;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ServiceMap;
import dao.BoardDao;
import dto.Board;

public class MapDetail implements ServiceMap {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		BoardDao boardDao = new BoardDao();
		Board board = boardDao.getBoardContent(request.getParameter("seqNum"));
		request.setAttribute("boardCon", board);
	}
}
