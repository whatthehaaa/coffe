package com.spring.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.spring.vo.SessionVO;

public class AuthHandlerInterceptor extends HandlerInterceptorAdapter{


	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
		    throws Exception {
		
		HttpSession session = request.getSession();
		SessionVO svo = (SessionVO)session.getAttribute("svo");
		
		if(svo == null) {
			response.sendRedirect("/project/login.do");
			return false;
	
		}
			return true; 
		}//preHandler
	
}
