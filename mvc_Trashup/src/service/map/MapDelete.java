package service.map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ServiceMap;
import dao.BoardDao;

public class MapDelete implements ServiceMap {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		BoardDao boardDao = new BoardDao();
		boardDao.delBoardCon(request.getParameter("seqNum"));
		

	}

}
