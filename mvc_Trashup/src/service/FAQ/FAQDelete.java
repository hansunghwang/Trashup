package service.FAQ;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ServiceFAQ;
import dao.NoticeDao;

public class FAQDelete implements ServiceFAQ {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		NoticeDao noticeDao = new NoticeDao();
		noticeDao.delNoticeCon(request.getParameter("seqNum"));
		

	}

}
