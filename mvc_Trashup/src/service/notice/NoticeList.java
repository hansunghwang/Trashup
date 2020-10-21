package service.notice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ServiceNotice;
import dao.NoticeDao;
import dto.Notice;


public class NoticeList implements ServiceNotice  {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		NoticeDao dao = new NoticeDao();
		
		List<Notice> dto = dao.getNoticeList();
		
		request.setAttribute("list", dto);
		
	}

}
