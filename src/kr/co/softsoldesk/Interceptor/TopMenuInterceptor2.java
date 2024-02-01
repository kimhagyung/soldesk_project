package kr.co.softsoldesk.Interceptor;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import kr.co.softsoldesk.beans.ProUserBean;
import kr.co.softsoldesk.beans.UserBean;

public class TopMenuInterceptor2 implements HandlerInterceptor{
 
	@Resource(name="loginProuserBean")
	private ProUserBean loginProuserBean;
	
	
	public TopMenuInterceptor2(ProUserBean loginProuserBean) {
		this.loginProuserBean = loginProuserBean;
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
 
		request.setAttribute("loginProuserBean", loginProuserBean); 
		return true;
	}
	
	
}
