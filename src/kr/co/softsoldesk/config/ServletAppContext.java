package kr.co.softsoldesk.config;
 
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.mapper.MapperFactoryBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import kr.co.softsoldesk.Interceptor.LoginInterceptor;
import kr.co.softsoldesk.Interceptor.TopMenuInterceptor;
import kr.co.softsoldesk.Interceptor.TopMenuInterceptor2;
import kr.co.softsoldesk.beans.ProUserBean;
import kr.co.softsoldesk.beans.UserBean;
import kr.co.softsoldesk.mapper.CalendarMapper;
import kr.co.softsoldesk.mapper.DetailCategoryMapper;
import kr.co.softsoldesk.mapper.ProUserMapper;
import kr.co.softsoldesk.mapper.ServiceCategoryMapper;
import kr.co.softsoldesk.mapper.UserMapper;
import kr.co.softsoldesk.service.PostService;


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
public class ServletAppContext implements WebMvcConfigurer {

	// 프로퍼티의 키를 활용해서 값 가져오기
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
	
	@Autowired
	private PostService postService;

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
		LoginInterceptor loginInterceptor = new LoginInterceptor(loginUserBean, loginProuserBean);

		InterceptorRegistration reg1 = registry.addInterceptor(topMenuInterceptor);
		InterceptorRegistration reg2 = registry.addInterceptor(topMenuInterceptor2);
		InterceptorRegistration reg3 = registry.addInterceptor(loginInterceptor);

		reg1.addPathPatterns("/**");// 모든 요청에서 동작
		reg2.addPathPatterns("/**");// 모든 요청에서 동작
		//reg3.addPathPatterns("/common/calendar");
		reg3.addPathPatterns("/common/myPage");
		reg3.addPathPatterns("/common/AccountModify");
		reg3.addPathPatterns("/common/AccountSetting");
		
		CheckWriterInterceptor checkWriterInterceptor = new CheckWriterInterceptor(loginUserBean, postService);
		
		InterceptorRegistration reg3 = registry.addInterceptor(checkWriterInterceptor);
		
		reg3.addPathPatterns("/board/modifyPost", "/board/delete");
		
	}
	
	 
	// 카테고리 mapper 등록
	@Bean
	public MapperFactoryBean<ServiceCategoryMapper> getServiceCategoryMapper(SqlSessionFactory factory)
			throws Exception {

		MapperFactoryBean<ServiceCategoryMapper> factoryBean = new MapperFactoryBean<ServiceCategoryMapper>(
				ServiceCategoryMapper.class);

		factoryBean.setSqlSessionFactory(factory);

		return factoryBean;
	}

	@Bean
	public MapperFactoryBean<DetailCategoryMapper> getDetilCategoryMapper(SqlSessionFactory factory) throws Exception {

		MapperFactoryBean<DetailCategoryMapper> factoryBean = new MapperFactoryBean<DetailCategoryMapper>(
				DetailCategoryMapper.class);

		factoryBean.setSqlSessionFactory(factory);

		return factoryBean;
	}

	//캘린더
	@Bean
	public MapperFactoryBean<CalendarMapper> getCalendarMapper(SqlSessionFactory factory) throws Exception {

		MapperFactoryBean<CalendarMapper> factoryBean = new MapperFactoryBean<CalendarMapper>(CalendarMapper.class);

		factoryBean.setSqlSessionFactory(factory);

		return factoryBean;
	}

	/*
	 * @Bean public MapperFactoryBean<TopMenuMapper>
	 * getTopMenuMapper(SqlSessionFactory factory) throws Exception {
	 * 
	 * MapperFactoryBean<TopMenuMapper> factoryBean = new
	 * MapperFactoryBean<TopMenuMapper>(TopMenuMapper.class);
	 * 
	 * factoryBean.setSqlSessionFactory(factory);
	 * 
	 * return factoryBean; }
	 */

	/*
	 * @Bean public MapperFactoryBean<UserMapper> getUserMapper(SqlSessionFactory
	 * factory) throws Exception {
	 * 
	 * MapperFactoryBean<UserMapper> factoryBean = new
	 * MapperFactoryBean<UserMapper>(UserMapper.class);
	 * 
	 * factoryBean.setSqlSessionFactory(factory);
	 * 
	 * return factoryBean; }
	 */

	// interceptor 등록하는 메소드
	/*
	 * @Override public void addInterceptors(InterceptorRegistry registry) {
	 * 
	 * //헤더 TopMenuInteceptor topMenuInterceptor = new
	 * TopMenuInteceptor(topMenuService, loginUserBean); InterceptorRegistration
	 * reg1 = registry.addInterceptor(topMenuInterceptor);
	 * reg1.addPathPatterns("/**"); //모든 요청에서 동작
	 * 
	 * //로그인 권한? 로그인하지 않았을 경우 CheckLoginInterceptor checkLoginInterceptor = new
	 * CheckLoginInterceptor(loginUserBean); InterceptorRegistration reg2 =
	 * registry.addInterceptor(checkLoginInterceptor);
	 * reg2.addPathPatterns("/user/modify", "/user/logout", "/board/*"); // 수정페이지,
	 * 로그아웃 페이지, 게시판 폴더의 페이지 요청시 인터셉터 reg2.excludePathPatterns("/board/main");
	 * //excludePathPatterns: 게시판 폴더의 main은 예외
	 * 
	 * 
	 * }
	 */
	//메시지와의 충돌방지, 프로퍼티 파일과 메시지를 구분하여 별도로 관리
		@Bean
		public static PropertySourcesPlaceholderConfigurer placeholderConfigurer() {
			return new PropertySourcesPlaceholderConfigurer();
		} 
	 
	// 에러 프로퍼티 파일을 메시지로 등록
	@Bean
	public ReloadableResourceBundleMessageSource messageSource() {
		ReloadableResourceBundleMessageSource res = new ReloadableResourceBundleMessageSource();
		res.setBasename("/WEB-INF/properties/error_message");
		return res;
	}


	public StandardServletMultipartResolver multipartResolver() {

		return new StandardServletMultipartResolver();
	}
	
	 @Override
	    public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
	        converters.add(new MappingJackson2HttpMessageConverter());
	    }
}
