package com.front.member.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
		
		return memberDao.SignIn("POST", url, params);
	}
}
