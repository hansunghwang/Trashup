package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.member.LogOut;
import service.member.LoginProc;
import service.member.MemRegProc;

@WebServlet(asyncSupported = true, urlPatterns = {"*.do"})
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	
	private void doAction(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		res.setContentType("text/html; charset=utf8"); 
		req.setCharacterEncoding("utf-8");
		
		String uri = req.getRequestURI();	
		String path = req.getContextPath();
		
		PrintWriter out = res.getWriter();		
		
//		String result = uri.substring(uri.lastIndexOf("/")+1);
		
		String cmd = uri.substring(path.length());
		
		
		String viewPage = null;
		if(cmd.equals("/memReg.do")) {		// 메뉴에서 회원등록 클릭
			viewPage = "/member/memRegForm.jsp";	//회원등록 폼
			
		} else if(cmd.equals("/memRegProc.do")) {	//회원 등록 버튼 클릭
			MemRegProc memRegProc = new MemRegProc();
			memRegProc.execute(req, res);				//저장 성공
			viewPage = "/index.jsp";
			
		} else if(cmd.equals("/tupMap.do")) {
			viewPage = "/tupMap.jsp";
			
		} else if(cmd.equals("/loginProc.do")) {
			LoginProc loginProc = new LoginProc();
			String pageChoose = loginProc.execute(req, res);
			if(pageChoose.equals("1")) {
				viewPage = "/tupMap.jsp";
			} else {
				viewPage = "/";
			}				
		} else if(cmd.equals("/logout.do")) {
			LogOut logout = new LogOut();
			logout.execute(req, res);
			viewPage = "/";
		} else if(cmd.equals("/myPage.do")) {
			viewPage = "/member/myPage.jsp";
		}
		
		RequestDispatcher rd = req.getRequestDispatcher(viewPage);
		rd.forward(req, res); 	//request와  response 정보를 memRegForm.jsp에 던져줌
		
	}
	
}
