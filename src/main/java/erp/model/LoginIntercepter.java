package erp.model;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import erp.hhh.HyunSuShow;
import erp.hhh.UserMapper;
import erp.hhh.UserVO;


@Service
public class LoginIntercepter implements HandlerInterceptor{
	
	@Resource
	UserMapper mapper;
	
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
    	
    	String acce_id = request.getParameter("acce_id");
    	String acce_pw = request.getParameter("acce_pw");
    	
    	UserVO data = mapper.logindata(acce_id);
    	data.setUser_pw(new HyunSuShow().decrypt(data.getUser_pw()));
    	if(data!=null && acce_pw.equals(data.getUser_pw())) {
    		request.getSession().setAttribute("mydata", data);
    		return true;
    	}
    	response.sendRedirect("/login/main");
    	return false;
    }

}
