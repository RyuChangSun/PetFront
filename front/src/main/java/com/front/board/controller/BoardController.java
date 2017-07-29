package com.front.board.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.front.board.service.BoardService;
import com.google.gson.Gson;

@Controller
public class BoardController {

	private static final String BOARD_LIST = "/board/boardList";  


	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value = "/boardList", method = {RequestMethod.GET})
	public @ResponseBody String boardList(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response ) throws Exception {

		String id = "1";//request.getParameter("email").toString();
		String pass = "2";//request.getParameter("password").toString();
		
		Map<String, Object> boardList = boardService.boardList(request, id, pass);
		
		//HttpSession session = request.getSession();
		//String sessionId = (String) session.getAttribute("sessionId");
		
		Map<String, String> resultMap = new HashMap<>();
		resultMap.put("result", "ok");  

		//resultMap.put("updateCount", memberInfo.toString());
		return BOARD_LIST;
		//Gson gson = new Gson();
		//return gson.toJson(resultMap);
		
	}
}
