package com.front.member.dao;

import java.util.Map;

public interface MemberDao {

	Map<String, Object> SignIn(String method, String url, String params);
	
	Map<String, Object> SignUp(String method, String url, String params);
}
