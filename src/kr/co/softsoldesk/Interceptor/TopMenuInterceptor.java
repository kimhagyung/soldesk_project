package kr.co.softsoldesk.Interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import kr.co.softsoldesk.beans.UserBean;

public class TopMenuInterceptor implements HandlerInterceptor{
 
	private UserBean loginUserBean;
	
	public TopMenuInterceptor(UserBean loginUserBean) {
		
		this.loginUserBean = loginUserBean;
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
	
		
		request.setAttribute("loginUserBean", loginUserBean);
		
		return true;
	}
	
	
}
