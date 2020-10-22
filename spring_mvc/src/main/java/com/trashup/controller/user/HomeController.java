package com.trashup.controller.user;


import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.trashup.service.BoardService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value = "/")
	public String home(HttpServletRequest request, Model model) {
		
		String keyword = "";
		
		if(request.getParameter("keyword") !=  null) {
			keyword = request.getParameter("keyword");
			request.setAttribute("keyword", keyword);
		}
		
		Map map = boardService.getBoardList(keyword);
		model.addAttribute("list", map.get("boardList"));
		return "index";
	}
	
}
