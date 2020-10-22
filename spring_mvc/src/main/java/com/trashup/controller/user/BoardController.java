package com.trashup.controller.user;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.trashup.domain.Board;
import com.trashup.service.BoardService;


@Controller
@RequestMapping(value="/board/")
public class BoardController {
	
	private static final Logger log = LoggerFactory.getLogger(BoardController.class);	
	
	//와이어링 : 객체를 자동으로 Spring bean에 생성
	@Autowired
	private BoardService boardService;	
	
	@RequestMapping(value="myPage")
	public String myPage(HttpSession session, HttpServletRequest request, Model model) {
		Map map = boardService.getMyBoardList(session, request);
		model.addAttribute("list", map.get("myBoardList"));
		return "member/myPage";
	}
	
	@RequestMapping(value="boardRegForm")
	public String boardRegForm() {
		return "board/boardRegForm";
	}
	
	@RequestMapping(value="boardReg")
	public String boardReg(Model model, Board board) {
		
		boardService.insertBoard(board);
		
		Map map = boardService.getBoardList("");
		model.addAttribute("list", map.get("boardList"));
		return "index";
	}
	
	@RequestMapping(value="myBoardDetail")
	public String myBoardDetail(HttpSession session, HttpServletRequest request, Model model) {
		Map map = boardService.getMyBoardList(session, request);
		model.addAttribute("list", map.get("myBoardList"));
		return "board/myBoardDetailList";
	}
	
	@RequestMapping(value="boardModify")
	public String boardModify(HttpSession session, HttpServletRequest request, Model model) {
		Map map = boardService.getMyBoardList(session, request);
		model.addAttribute("list", map.get("myBoardList"));
		return "board/myBoardModify";
	}
	
	@RequestMapping(value="boardDelete")
	public String boardDelete(Board board) {
		boardService.deleteBoard(board);
		return "board/myBoardDetailList";
	}
}
