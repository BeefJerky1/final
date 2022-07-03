package com.kh.e3i1.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
@Component
public class MemberLoginInterceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Integer memberNo = (Integer) request.getSession().getAttribute("login");
		if(memberNo == null) {
			response.sendRedirect(request.getContextPath()+"/member/login");
			return false;
		}
		else {
			return true;
		}
	}
}







