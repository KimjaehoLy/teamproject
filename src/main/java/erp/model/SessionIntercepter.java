package erp.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;

import erp.hhh.UserVO;

@Service
public class SessionIntercepter implements HandlerInterceptor{

	
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
    	boolean  blnRtn = false ;
    	HttpSession httpSession = request.getSession();
		
		try {
			
	        if( httpSession.getAttributeNames().hasMoreElements()){
	        	// 세션이 있는 경우
	        	blnRtn = true;
	        } else {
	        	// 세션이 없는 경우
	            response.sendRedirect("/login/main");
	            blnRtn = false;
	        }
		} catch (Exception e) {
			// TODO: handle exception
		}
        
        return blnRtn;
    }
}
