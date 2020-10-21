package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.notice.NoticeDetail;
import service.notice.NoticeList;

@WebServlet(asyncSupported = true, urlPatterns = {"*.ad"})
public class FAQController extends HttpServlet {
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
		out.print(cmd);
		
		String viewPage = "";
		 if (cmd.equals("/notice.ad")) {
			NoticeList dao = new NoticeList(); 
			dao.execute(request, response);
			viewPage = "/admin_notice.jsp";
		 }	
//		} else if (cmd.equals("/noticeCon.ad")) {
//			NoticeDetail noticeDetail = new NoticeDetail();
//			noticeDetail.execute(request, response);
//			viewPage = "/admin_noticeContent.jsp";
//			
//		} else if (cmd.equals("/noticeModify.ad")) {
//			NoticeModify noticeModify = new NoticeModify();
//			noticeModify.execute(request, response);
//	
//			NoticeDetail noticeDetail = new NoticeDetail();
//			noticeDetail.execute(request, response);
//			
//			request.setAttribute("preAction", "noticeModify");
//			request.setAttribute("preActRes", "modified");
//			
//			viewPage = "/admin_noticeContent.jsp";
//			
//		} else if (cmd.equals("/noticeDelete.ad")) {
//			NoticeDelete noticeDelete = new NoticeDelete();
//			noticeDelete.execute(request, response);
//			
//			NoticeList dao = new NoticeList(); 
//			dao.execute(request, response);
//			
//			request.setAttribute("preAction", "noticeDelete");
//			request.setAttribute("preActRes", "deleted");
//			viewPage = "/admin_notice.jsp";
//			
//		} else if (cmd.equals("/noticeRegForm.ad")) {
//			viewPage = "/admin_noticeReg.jsp";
//			
//		} else if (cmd.equals("/noticeReg.ad")) {
//			NoticeInsert noticeInsert = new NoticeInsert();
//			
//			NoticeList dao = new NoticeList(); 
//			dao.execute(request, response);
//			viewPage += "/admin_notice.jsp";
//		}
			
		
		
		
		RequestDispatcher rd = request.getRequestDispatcher(viewPage);
		rd.forward(request, response); 	
		
	}
	
}
