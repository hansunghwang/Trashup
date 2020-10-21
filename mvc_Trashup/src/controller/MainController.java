package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.board.BoardList;


@WebServlet("/home.do")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf8"); 
		request.setCharacterEncoding("utf-8");
		
		BoardList boardList = new BoardList(); 				
		boardList.execute(request, response);
	
		RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
		rd.forward(request, response); 	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
