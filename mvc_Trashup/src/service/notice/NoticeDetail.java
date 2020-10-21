package service.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ServiceNotice;
import dao.NoticeDao;
import dto.Notice;

public class NoticeDetail implements ServiceNotice {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		NoticeDao noticeDao = new NoticeDao();
		Notice notice = noticeDao.getNoticeContent(request.getParameter("seqNum"));
		request.setAttribute("noticeCon", notice);
	}

}
