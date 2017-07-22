package com.front.member.dao;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.front.utils.ApiUtil;
import com.google.gson.Gson;

@Service("memberDao")
public class MemberDaoImpl implements MemberDao{
    
	@Override
	public Map<String, Object> SignIn(String method, String url, String params)
	{
		Gson gson = new Gson(); 
		String json = ApiUtil.CallApi(method, url, params);
		Map<String,Object> map = new HashMap<String,Object>();
		map = (Map<String,Object>) gson.fromJson(json, map.getClass());
		
		return map;
	}
}
