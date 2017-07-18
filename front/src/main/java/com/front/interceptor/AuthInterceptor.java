package com.front.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter {

	private static final String REDIRECT_LOGIN_FORM = "/signIn";  

	protected Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {

		logger.debug("### AuthInterceptor Start ###");

		HttpSession session = request.getSession();
		String sessionId = (String) session.getAttribute("sessionId");

		logger.debug("AuthInterceptor sessionId::" + sessionId);
		logger.debug("AuthInterceptor session.getId()::" + session.getId());

		if(sessionId != null && session.getId().equals(sessionId)) {
			logger.debug("### AuthInterceptor 인증성공###");
		} else {
			logger.debug("### AuthInterceptor 인증실패 ###");
			logger.debug("Redirect to REDIRECT_LOGIN_FORM:: " + REDIRECT_LOGIN_FORM);
			response.sendRedirect(REDIRECT_LOGIN_FORM);
			return false;
		}

		logger.debug("## AuthInterceptor End ###");
		return super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		super.afterCompletion(request, response, handler, ex);
	}
}
