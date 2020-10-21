package service.map;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ServiceMap;
import dao.BoardDao;
import dto.Board;

public class MapList implements ServiceMap  {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		BoardDao dao = new BoardDao();
		
		List<Board> dto = dao.getBoardList();
		
		request.setAttribute("list", dto);
		
		
	}

}
