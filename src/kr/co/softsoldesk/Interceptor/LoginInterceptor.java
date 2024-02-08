package kr.co.softsoldesk.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import kr.co.softsoldesk.beans.ProUserBean;
import kr.co.softsoldesk.beans.UserBean;

public class LoginInterceptor implements HandlerInterceptor{
	
	private UserBean loginUserBean;
	private ProUserBean loginProuserBean;
	
	public LoginInterceptor(UserBean loginUserBean, ProUserBean loginProuserBean) {
		
		this.loginUserBean = loginUserBean;
		this.loginProuserBean = loginProuserBean;
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		if(loginUserBean.isUserLogin() == false && loginProuserBean.isProuserLogin() == false) {
			String contextPath = request.getContextPath();
			//웹브라우져에게 요청하라고 지시함
			response.sendRedirect(contextPath + "/user/not_login");
			//다음 단계로 이동하지 않음
			return false;
		} 
		//로그인 되어 있는 상태
		return true;
	}

	
}