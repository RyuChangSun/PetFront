package com.front.member.controller;

import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.front.member.service.MemberService;

@Controller
public class MemberController {

	private static final String VIEW_SIGNIN = "/member/signIn";  

	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "/signIn", method = {RequestMethod.GET})
	public String signIn(Locale locale, Model model) {

		
		return VIEW_SIGNIN;
	}
	
	@RequestMapping(value = "/signIn", method = {RequestMethod.POST})
	public String signIn(Locale locale, Model model, HttpServletRequest request) {

		String id = request.getParameter("email").toString();
		String pass = request.getParameter("password").toString();
		
		Map<String, Object> memberInfo = memberService.SignIn(request, id, pass);
		
		return VIEW_SIGNIN;
	}
}
