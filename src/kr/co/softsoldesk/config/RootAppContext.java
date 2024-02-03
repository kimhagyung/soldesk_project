package kr.co.softsoldesk.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.context.annotation.SessionScope;

import kr.co.softsoldesk.beans.ProUserBean;
import kr.co.softsoldesk.beans.UserBean;

//import kr.co.softsoldesk.beans.UserBean;

@Configuration
public class RootAppContext {
	
	//유저 로그인 
	@Bean("loginUserBean") 
	@SessionScope
	public UserBean loginUserBean() {
		return new UserBean();
	}
	
	//일류로그인
	@Bean("loginProuserBean") 
	@SessionScope
	public ProUserBean ProUserBean() { 
		return new ProUserBean();
	}
}
