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
    
    @Value("#{restapi['signUpUrl']}")
    private String signUpUrl;
    
	@Override
	public Map<String,Object> SignIn(HttpServletRequest request)
	{
		String id = request.getParameter("email").toString();
		String pass = request.getParameter("password").toString();		
		
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
	
	@Override
	public Map<String,Object> SignUp(HttpServletRequest request)
	{
		String id = request.getParameter("email").toString();
		String pass = request.getParameter("password").toString();		
		
		String params = String.format("id=%s&pass=%s", id, pass);
		
		String url = ApiUtil.GetApiUrl(request, "signUp");
				
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
