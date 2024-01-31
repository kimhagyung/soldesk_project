package kr.co.softsoldesk.config;

import javax.servlet.Filter;
import javax.servlet.FilterRegistration;
import javax.servlet.MultipartConfigElement;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;



public class SpringConfigClass implements WebApplicationInitializer{
//�ڹ��ڵ�� web.xml�� ��ü
//�����ø����̼� ����(��Ĺ)�� ���� ���� �� ���� ���� ����
	
	
	@Override
	public void onStartup(ServletContext servletContext) throws ServletException {
		//���� ���� ���� �� ���� �ִ� �޼ҵ� �����
		//System.out.println("onstart");
		
		//web.xml<servlet>
		AnnotationConfigWebApplicationContext servletAppContext = new AnnotationConfigWebApplicationContext();
		//SpringMVC ������Ʈ ��ġ�� ���� �ۼ��ϴ� Ŭ������ ��ü�� ����(������ �����̳�)
		servletAppContext.register(ServletAppContext.class);
		//ServletAppContext�� ���ø����̼� ���׽�Ʈ�� ���
		
		DispatcherServlet dispatcherServlet = new DispatcherServlet(servletAppContext);
		ServletRegistration.Dynamic servlet = servletContext.addServlet("dispatcher", dispatcherServlet);
		
		servlet.setLoadOnStartup(1);
		servlet.addMapping("/");
		
		AnnotationConfigWebApplicationContext rootAppContext = new AnnotationConfigWebApplicationContext();
		rootAppContext.register(RootAppContext.class);
		//Bean�� �����ϴ� Ŭ���� ����
		
		ContextLoaderListener listener = new ContextLoaderListener(rootAppContext);
		servletContext.addListener(listener);
		//web.xml���� <listener>
		
		FilterRegistration.Dynamic filter = servletContext.addFilter("encoding", CharacterEncodingFilter.class);
		filter.setInitParameter("encoding", "UTF-8");
		//web.xml���� <filter>
		
		filter.addMappingForServletNames(null, false, "dispatcher");
		//dispatcher�� ���� �߰��� Servlet���� UTF-8�� ���ڵ�
		
		MultipartConfigElement multipartConfigElement = new MultipartConfigElement(null, 52428800, 52428800, 0);
		
		servlet.setMultipartConfig(multipartConfigElement);
	} 
	
}


/*
public class SpringConfigClass extends AbstractAnnotationConfigDispatcherServletInitializer {

	@Override
	protected Class<?>[] getRootConfigClasses() {
		
		return new Class[] {RootAppContext.class};
	} //������Ʈ���� ����� Beans���� �����ϱ� ���� Ŭ���� ����

	@Override
	protected Class<?>[] getServletConfigClasses() {
		
		return new Class[] {ServletAppContext.class};
	} //Spring MVC ������Ʈ ������ ���� Ŭ���� ����

	@Override
	protected String[] getServletMappings() {
		
		return new String[] {"/"};
	} // DispatcherServlet�� ������ ��û �ּҸ� ����

	@Override
	protected Filter[] getServletFilters() {
		
		CharacterEncodingFilter encodingFilter = new CharacterEncodingFilter();
		encodingFilter.setEncoding("UTF-8");
		return new Filter[] {encodingFilter};
	} // �Ķ���� ���ڵ� ���� ����
	
	
} */