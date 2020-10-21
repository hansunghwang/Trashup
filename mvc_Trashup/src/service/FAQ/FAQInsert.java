package service.FAQ;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ServiceFAQ;
import dao.NoticeDao;
import dto.Notice;

public class FAQInsert implements ServiceFAQ {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		NoticeDao noticeDao = new NoticeDao();
		
		Notice notice = new Notice();
		notice.setTitle(request.getParameter("id"));
		notice.setTitle(request.getParameter("title"));
		notice.setContent(request.getParameter("content"));
		notice.setIsOpen(request.getParameter("isOpen"));
		
		noticeDao.insertNotice(notice);
		

	}

}
