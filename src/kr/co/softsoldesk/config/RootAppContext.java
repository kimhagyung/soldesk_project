package kr.co.softsoldesk.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.context.annotation.SessionScope;

import kr.co.softsoldesk.beans.UserBean;

//import kr.co.softsoldesk.beans.UserBean;

@Configuration
public class RootAppContext {
	@Bean("loginUserBean") //로그인 상태값을 가지고 다니기 위한 userBean이기 때문에 다른 userBean들과 차별점을 두도록함.
	@SessionScope
	public UserBean loginUserBean() {
		return new UserBean();
	}
}
