package com.front.board.dao;

import java.util.Map;

public interface BoardDao {

	Map<String, Object> boardList(String method, String url, String params);
}
