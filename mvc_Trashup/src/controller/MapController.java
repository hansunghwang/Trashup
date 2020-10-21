package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.board.BoardInsert;
import service.board.BoardList;
import service.board.BoardSearch;
import service.member.LogOut;
import service.member.LoginProc;
import service.member.MemRegProc;

@WebServlet(asyncSupported = true, urlPatterns = {"*.bo"})
public class MapController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	
	private void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=utf8"); 
		request.setCharacterEncoding("utf-8");
		
		String uri = request.getRequestURI();	
		String path = request.getContextPath();
		
		PrintWriter out = response.getWriter();		
		
		String cmd = uri.substring(path.length());
		
		out.print("보드 CCC");
		
		String viewPage = null;
		if(cmd.equals("/boardRegForm.bo")) {
			viewPage="/board/boardRegForm.jsp";
			
		} else if(cmd.equals("/boardReg.bo")) {
			BoardInsert boardInsert = new BoardInsert();
			boardInsert.execute(request, response);
			
			BoardList boardList = new BoardList(); 				
			boardList.execute(request, response);
			
			viewPage = "/index.jsp";
		
		} else if(cmd.equals("/search.bo")) {
			BoardSearch boardSearch = new BoardSearch();
			boardSearch.execute(request, response);
			
			viewPage = "/index.jsp";
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(viewPage);
		rd.forward(request, response); 	
		
	}
	
}
