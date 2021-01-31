package erp.model;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcCon implements WebMvcConfigurer{

	@Resource
	AuthorityIntercepter authointerceptor;
	
	@Resource
	LoginIntercepter interceptor;
	
	@Resource
	SessionIntercepter seinterceptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		registry.addInterceptor(interceptor).addPathPatterns("/login/reg");
		
		registry.addInterceptor(seinterceptor).addPathPatterns("/fioerp").addPathPatterns("/template/**");	
		
		ArrayList<String> arr = new ArrayList<String>();	
		
		arr.add("/template/aview/search/list");
		arr.add("/template/hview/members/list");
		arr.add("/template/bview/suju/list");
		arr.add("/template/sview/invensta/list");
		arr.add("/template/jview/journal/list");
		
		registry.addInterceptor(authointerceptor).addPathPatterns(arr);

	}
}
