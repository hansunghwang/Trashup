package service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ServiceNotice;
import dao.BoardDao;

public class BoardDelete implements ServiceNotice {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		BoardDao boardDao = new BoardDao();
		boardDao.delBoardCon(request.getParameter("seqNum"));
		

	}

}
