package erp.jjj;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import erp.Action;


@Service("correpondentdeletechk")
public class CorrepondentDeleteChk implements Action{

	@Resource
	CorrepondentMapper mapper;
	
	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest req) {
		if(mapper.sulist((String)req.getParameter("goco"))!=0) {
			req.setAttribute("chk", "실패");			
		}
		return null;
	}

}
