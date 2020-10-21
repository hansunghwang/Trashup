package service.board;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import common.ServiceBoard;
import dao.BoardDao;
import dto.Board;
import dto.UploadFiles;
import net.coobird.thumbnailator.Thumbnailator;

public class BoardUpdate implements ServiceBoard {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		BoardDao boardDao = new BoardDao();
		UploadFiles uploadFiles = null;
		Board board = new Board();
		int cnt = 0;
		
		String CHARSET = "utf-8";
		String UPLOAD_DIR = "d:\\hansung\\fileUpload";
		int MAX_SIZE_BYTES = 1023 * 1024 * 100;
		
		File uplaodDir = new File(UPLOAD_DIR);
		DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
		fileItemFactory.setRepository(uplaodDir);
		fileItemFactory.setSizeThreshold(MAX_SIZE_BYTES);
		ServletFileUpload fileUpload = new ServletFileUpload(fileItemFactory);
		
		try {
			List<FileItem> items = fileUpload.parseRequest(request);		
			
			String category = "";
			
			HttpSession sess = request.getSession();
			board.setId(sess.getAttribute("sessId").toString());
			
			for(FileItem item : items) {
				
				if(item.isFormField()) {  //뷰페이지의 form에 있는 필드인지 아닌지 검사
					System.out.printf("파라미터 명: %s, 파라미터 값: %s\n", item.getFieldName(),item.getString(CHARSET));
					if(item.getFieldName().equals("title")) board.setTitle(item.getString(CHARSET));
					if(item.getFieldName().equals("content")) board.setContent(item.getString(CHARSET));
					if(item.getFieldName().equals("isOpen")) board.setIsOpen(item.getString(CHARSET));
//					if(item.getFieldName().equals("id")) board.setId(item.getString(CHARSET));
					
					if(item.getFieldName().equals("category")) {
						category += item.getString(CHARSET) + "#";
						cnt += 1;
					}
					
				} else {
					System.out.printf("파라미터 명: %s, 파일 명: %s, 파일 크기 : %s bytes \n", item.getFieldName(), item.getName(), item.getSize());
					
					if(item.getSize() > 0) {
						
						uploadFiles = new UploadFiles();
						
						String separator = File.separator; // 구분자(역슬래쉬 슬래쉬냐)를 가져옴
						
						//저장할 디렉토리 생성
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
						Date date = new Date();
						
						String uploadFolder = sdf.format(date);
						
						//d:\hansung\fileUpload\2020-08-13
						String uploadPathStr = UPLOAD_DIR + separator + uploadFolder;
						
						File uploadPath = new File(uploadPathStr);
						if(uploadPath.exists() == false) {
							uploadPath.mkdirs();
						}
						
						//중복 파일 구분 위한 파일이름 생성
						UUID uid = UUID.randomUUID();  		  //유일한 랜던값을 뽑아 옴
						
						String uplaodFileName = item.getName();
						
						int idx = uplaodFileName.lastIndexOf(".");		//0부터 셈
						
						String fileName = uplaodFileName.substring(0,idx);
						String fileExtension = uplaodFileName.substring(idx+1);
						//System.out.printf("파일 이름: %s, 파일 확장자: %s", fileName, fileExtension);
						
						String saveFileName = fileName + "_" + uid.toString() + "." + fileExtension;
						String saveFileStr = uploadPathStr + separator + saveFileName;
												
						
						File saveFile = new File(saveFileStr);
						
						//업로드 파일 타입구하기
						String contentType = Files.probeContentType(saveFile.toPath());
						
						String t_fileNameStr = null;
						if(contentType.startsWith("image")) { 
							String t_uploadPathStr = UPLOAD_DIR + separator +"thumbnail"+ separator + uploadFolder;
							
							File t_uploadPath = new File(t_uploadPathStr);
							if(t_uploadPath.exists() == false) {
								t_uploadPath.mkdirs();
							}
							
							t_fileNameStr = t_uploadPathStr + separator + "t_" + saveFileName;
							File t_file = new File(t_fileNameStr);
							
							FileOutputStream t_fos = new FileOutputStream(t_file);
							
							Thumbnailator.createThumbnail(item.getInputStream(), t_fos, 200, 200);
							t_fos.close();
														
						}				
						
						//파일 저장
						item.write(saveFile);
						
						uploadFiles.setSaveFile(saveFileName);
						uploadFiles.setUploadFile(uplaodFileName);
						uploadFiles.setSavePath(uploadPathStr);
						uploadFiles.setFileSize((int)item.getSize());
						uploadFiles.setFileType(contentType);
						uploadFiles.setThumbnail(t_fileNameStr);
												
					}
				}
			}
			
			board.setCategory(category);
			
		} catch (FileUploadException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
		boardDao.insertBoard(board, uploadFiles, cnt);

	}

}
