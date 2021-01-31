package erp.model;

import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;

import ch.qos.logback.classic.Logger;
import erp.hhh.UserMapper;
import erp.hhh.UserVO;

@Service
public class AuthorityIntercepter implements HandlerInterceptor {

	
	@Resource
	UserMapper mapper;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("실행되는지 체크");
		UserVO vo = (UserVO)request.getSession().getAttribute("mydata");
		/*
		 * 인사부 품질부 재고부 영업부 회계부 
		 */
		System.out.println("url-->>>>"+request.getRequestURI().toString());
		
		if(request.getRequestURI().toString().equals("/template/hview/members/list") && vo.getUser_cate().equals("인사부")) {
			System.out.println("인사부 실행");			
			return true;
		}else if(request.getRequestURI().toString().equals("/template/aview/search/list") && vo.getUser_cate().equals("품질부")) {
			System.out.println("품질부 실행");
			return true;
		}else if(request.getRequestURI().toString().equals("/template/bview/suju/list") && vo.getUser_cate().equals("영업부")) {
			System.out.println("영업부 실행");
			return true;
		}else if(request.getRequestURI().toString().equals("/template/sview/invensta/list") && vo.getUser_cate().equals("재고부")) {
			System.out.println("재고부 실행");
			return true;
		}else if(request.getRequestURI().toString().equals("/template/jview/journal/list") && vo.getUser_cate().equals("회계부")) {
			System.out.println("회계부 실행");
			return true;
		}
		
		response.setCharacterEncoding("UTF-8"); 
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter printwriter = response.getWriter();


		printwriter.print("<script>alert('권한이 없습니다.'); history.go(-1);</script>");

		printwriter.flush();

		printwriter.close();

		return false;
	}

}
