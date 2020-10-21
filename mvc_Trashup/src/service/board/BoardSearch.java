package service.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ServiceBoard;
import dao.BoardDao;
import dto.Board;

public class BoardSearch implements ServiceBoard {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		BoardDao boardDao = new BoardDao();
		
		String keyword = request.getParameter("keyword");
		
		List<Board> dto = boardDao.searchBoard(keyword);
		
		request.setAttribute("keyword", keyword);
		request.setAttribute("list", dto);
	}

}
