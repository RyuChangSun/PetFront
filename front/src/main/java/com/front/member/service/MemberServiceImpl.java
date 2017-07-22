package com.front.member.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.front.member.dao.MemberDao;
import com.front.utils.ApiUtil;

@Service("memberService")
public class MemberServiceImpl implements MemberService{

	@Autowired(required=false)
	private MemberDao memberDao;
	
    @Value("#{restapi['signInUrl']}")
    private String signInUrl;
    
	@Override
	public Map<String,Object> SignIn(HttpServletRequest request, String id, String pass)
	{
		String params = String.format("id=%s&pass=%s", id, pass);
		
		String url = ApiUtil.GetApiUrl(request, signInUrl);
				
		Map<String, Object> returnMap = new HashMap<>();  
		returnMap = memberDao.SignIn("POST", url, params);

		if (returnMap != null && returnMap.size() > 0)
		{
			HttpSession session = request.getSession();
			session.setAttribute("sessionId", session.getId());
			session.setAttribute("email", returnMap.get("email"));
		}

		return returnMap;
	}
	
	
}
