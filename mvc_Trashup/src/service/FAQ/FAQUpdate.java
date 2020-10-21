package service.FAQ;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ServiceFAQ;
import dao.NoticeDao;
import dto.Notice;

public class FAQUpdate implements ServiceFAQ {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		NoticeDao noticeDao = new NoticeDao();
		
		Notice notice = new Notice();
		
		int seqNum = Integer.parseInt(request.getParameter("seqNum"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String isOpen = request.getParameter("isOpen");
//		String saveFile = request.getParameter("saveFile");
//		String uploadFile = request.getParameter("uploadFile");
//		String filePath = request.getParameter("filePath");
		
		notice.setSeqNum(seqNum);
		notice.setTitle(title);
		notice.setContent(content);
		notice.setIsOpen(isOpen);
//		notice.setSaveFile(saveFile);
//		notice.setUploadFile(uploadFile);
//		notice.setFilePath(filePath);
		
		noticeDao.updateNotice(notice);
		
	}

}
