package kr.co.softsoldesk.config;
 
import javax.annotation.Resource;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.mapper.MapperFactoryBean;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import kr.co.softsoldesk.Interceptor.TopMenuInterceptor;
import kr.co.softsoldesk.Interceptor.TopMenuInterceptor2;
import kr.co.softsoldesk.beans.ProUserBean;
import kr.co.softsoldesk.beans.UserBean;
import kr.co.softsoldesk.mapper.PostMapper;
import kr.co.softsoldesk.mapper.ProUserMapper; 
import kr.co.softsoldesk.mapper.UserMapper;


/*import kr.co.softsoldesk.Inteceptor.CheckLoginInterceptor;
import kr.co.softsoldesk.Inteceptor.TopMenuInteceptor;
import kr.co.softsoldesk.beans.UserBean;
import kr.co.softsoldesk.mapper.TopMenuMapper;
import kr.co.softsoldesk.mapper.UserMapper;
import kr.co.softsoldesk.service.TopMenuService;*/


@Configuration
@EnableWebMvc
@ComponentScan("kr.co.softsoldesk.controller")
@ComponentScan("kr.co.softsoldesk.dao")
@ComponentScan("kr.co.softsoldesk.service") // dao와 service를 빈으로 등록
@PropertySource("/WEB-INF/properties/db.properties")
public class ServletAppContext implements WebMvcConfigurer{
	
	//프로퍼티의 키를 활용해서 값 가져오기
	@Value("${db.classname}")
	private String db_classname;
	
	@Value("${db.url}")
	private String db_url;
	
	@Value("${db.username}")
	private String db_username;
	
	@Value("${db.password}")
	private String db_password;
	
	@Resource(name="loginUserBean")
	private UserBean loginUserBean; 
	
	@Resource(name="loginProuserBean")
	private ProUserBean loginProuserBean; 

	/*
	 * @Autowired private TopMenuService topMenuService;
	 * 
	 * @Resource(name = "loginUserBean") private UserBean loginUserBean;
	 */
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		WebMvcConfigurer.super.addResourceHandlers(registry);
		registry.addResourceHandler("/**").addResourceLocations("/resource/");
	}

	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		WebMvcConfigurer.super.configureViewResolvers(registry);
		registry.jsp("/WEB-INF/views/", ".jsp");
		
	}
	
	@Bean
	public BasicDataSource dataSource() {
		BasicDataSource source = new BasicDataSource();
		source.setDriverClassName(db_classname);
		source.setUrl(db_url);
		source.setUsername(db_username);
		source.setPassword(db_password);
		
		return source;
	}

	@Bean
	public SqlSessionFactory factory(BasicDataSource source) throws Exception {
		
		SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
		factoryBean.setDataSource(source);
		
		SqlSessionFactory factory = factoryBean.getObject();
		
		return factory;
	}

	
	@Bean // 다른 Mapper <> 이 부분만 바꿔서 생성해주면 됨
	public MapperFactoryBean<PostMapper> PostMapper(SqlSessionFactory factory) throws Exception{
		
		MapperFactoryBean<PostMapper> factoryBean = new MapperFactoryBean<PostMapper>(PostMapper.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}

	@Bean
	public MapperFactoryBean<UserMapper> getUserMapper(SqlSessionFactory factory)throws Exception{
		
		MapperFactoryBean<UserMapper> factoryBean = new MapperFactoryBean<UserMapper>(UserMapper.class);

		factoryBean.setSqlSessionFactory(factory);
		
		return factoryBean;
	}


	@Bean
	public MapperFactoryBean<ProUserMapper> getProUserMapper(SqlSessionFactory factory)throws Exception{
		
		MapperFactoryBean<ProUserMapper> factoryBean = new MapperFactoryBean<ProUserMapper>(ProUserMapper.class);
		factoryBean.setSqlSessionFactory(factory);
		
		return factoryBean;
	}
	
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
	
		TopMenuInterceptor topMenuInterceptor = new TopMenuInterceptor(loginUserBean);
		TopMenuInterceptor2 topMenuInterceptor2 = new TopMenuInterceptor2(loginProuserBean);
		
		InterceptorRegistration reg1 = registry.addInterceptor(topMenuInterceptor);
		InterceptorRegistration reg2 = registry.addInterceptor(topMenuInterceptor2);
		
		
		reg1.addPathPatterns("/**");//모든 요청에서 동작
		reg2.addPathPatterns("/**");//모든 요청에서 동작
		
	}
	//메시지와의 충돌방지, 프로퍼티 파일과 메시지를 구분하여 별도로 관리
	@Bean
	public static PropertySourcesPlaceholderConfigurer placeholderConfigurer() {
		return new PropertySourcesPlaceholderConfigurer();
	} 
	//에러 프로퍼티 파일을 메시지로 등록
	@Bean
	public ReloadableResourceBundleMessageSource messageSource() {
		ReloadableResourceBundleMessageSource res = new ReloadableResourceBundleMessageSource();
		res.setBasename("/WEB-INF/properties/error_message");
		return res;
	}
	
	@Bean
	public StandardServletMultipartResolver multipartResolver() {
		return new StandardServletMultipartResolver();
	}
	
}
