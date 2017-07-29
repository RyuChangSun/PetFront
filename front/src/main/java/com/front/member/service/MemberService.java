package com.front.member.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface MemberService {

	// 로그인 
	Map<String, Object> SignIn(HttpServletRequest request);
	
	// 회원가입   
	Map<String, Object> SignUp(HttpServletRequest request);	
}
