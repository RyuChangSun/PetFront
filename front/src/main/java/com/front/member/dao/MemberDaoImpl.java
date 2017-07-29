package com.front.member.dao;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.front.utils.ApiUtil;
import com.front.utils.Util;

@Service("memberDao")
public class MemberDaoImpl implements MemberDao{
    
	@Override
	public Map<String, Object> SignIn(String method, String url, String params)
	{
		String json = ApiUtil.CallApi(method, url, params);		
		Map<String,Object> map = Util.ConvertJsonToMap(json);
		
		return map;
	}
	
	@Override
	public Map<String, Object> SignUp(String method, String url, String params)
	{
		String json = ApiUtil.CallApi(method, url, params);
		Map<String,Object> map = Util.ConvertJsonToMap(json);
		
		return map;
	}
}
