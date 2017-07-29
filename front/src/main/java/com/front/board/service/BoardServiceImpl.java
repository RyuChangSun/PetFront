package com.front.board.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.front.board.dao.BoardDao;
import com.front.utils.ApiUtil;

@Service("boardService")
public class BoardServiceImpl implements BoardService{

	@Autowired(required=false)
	private BoardDao boardDao;
	
    @Value("#{restapi['boardList']}")
    private String boardList;
    
	@Override
	public Map<String,Object> boardList(HttpServletRequest request, String id, String pass)
	{
		String params = String.format("id=%s&pass=%s", id, pass);
		
		String url = ApiUtil.GetApiUrl(request, boardList);
				
		Map<String, Object> returnMap = new HashMap<>();  
		returnMap = boardDao.boardList("POST", url, params);

		if (returnMap != null && returnMap.size() > 0)
		{
			HttpSession session = request.getSession();
			session.setAttribute("sessionId", session.getId());
			session.setAttribute("email", returnMap.get("email"));
		}

		return returnMap;
	}
	
}
