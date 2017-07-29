package com.front.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.front.member.service.MemberService;
import com.google.gson.Gson;

@Controller
public class MemberController {

	private static final String VIEW_SIGNIN = "/member/signIn";  
	private static final String VIEW_SIGNUP = "/member/signUp";  


	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "/signIn", method = {RequestMethod.GET})
	public String signIn(Locale locale, Model model) {

		return VIEW_SIGNIN;
	}
	
	@RequestMapping(value = "/signIn", method = {RequestMethod.POST})
	public @ResponseBody String signIn(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response ) throws Exception {

		String id = request.getParameter("email").toString();
		String pass = request.getParameter("password").toString();
		
		Map<String, Object> memberInfo = memberService.SignIn(request, id, pass);
		
		HttpSession session = request.getSession();
		String sessionId = (String) session.getAttribute("sessionId");
		
		Map<String, String> resultMap = new HashMap<>();
		resultMap.put("result", "ok");  

		if (memberInfo == null)
			resultMap.put("memberInfo", "0");  
		else
			resultMap.put("memberInfo", String.valueOf(memberInfo.size()));
		
		Gson gson = new Gson();
		return gson.toJson(resultMap);
	}
	
	@RequestMapping(value = "/signUp", method = {RequestMethod.GET})
	public String signUp(Locale locale, Model model) {

		return VIEW_SIGNUP;
	}
}
