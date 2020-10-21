package service.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ServiceBoard;
import dao.BoardDao;
import dto.Board;

public class BoardList implements ServiceBoard  {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		BoardDao dao = new BoardDao();
		
		List<Board> dto = dao.getBoardList();
		
		request.setAttribute("list", dto);
		
		
	}

}
