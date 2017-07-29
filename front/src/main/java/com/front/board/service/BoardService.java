package com.front.board.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface BoardService {
	Map<String, Object> boardList(HttpServletRequest request, String id, String pass);
}
