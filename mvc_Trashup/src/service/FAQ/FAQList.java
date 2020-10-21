package service.FAQ;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ServiceFAQ;
import dao.NoticeDao;
import dto.Notice;


public class FAQList implements ServiceFAQ  {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		NoticeDao dao = new NoticeDao();
		
		List<Notice> dto = dao.getNoticeList();
		
		request.setAttribute("list", dto);
		
	}

}
