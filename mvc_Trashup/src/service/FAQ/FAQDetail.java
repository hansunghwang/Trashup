package service.FAQ;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ServiceFAQ;
import dao.NoticeDao;
import dto.Notice;

public class FAQDetail implements ServiceFAQ {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		NoticeDao noticeDao = new NoticeDao();
		Notice notice = noticeDao.getNoticeContent(request.getParameter("seqNum"));
		request.setAttribute("noticeCon", notice);
	}

}
