package erp.model;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

public class EventIntercepter implements HandlerInterceptor{
	
	@Override
	public boolean preHandle(
			HttpServletRequest request, 
			HttpServletResponse response, 
			Object handler)throws Exception {
		
		System.out.println("preHandle() 진입");
		
		HashMap<String, Member>map = new HashMap();
		
		map.put("aaa", new Member("aaa", "1111", "김김김"));
		map.put("bbb", new Member("bbb", "2222", "박박박"));

		String pid = request.getParameter("pid");
		String pw = request.getParameter("password");
		

		if(map.containsKey(pid) && map.get(pid).getPw().equals(pw)) {
			
			return false;
		}
			
		return true;
	}

}
