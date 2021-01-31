package erp.jjj;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import erp.Action;


@Service("correpondentinsertchk")
public class CorrepondentInsertChk implements Action{
	
	@Resource
	CorrepondentMapper mapper;
	
	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest req) {
		
		map.get("jccro");
		CorrepondentVO vo = (CorrepondentVO)map.get("jccro");
		

		if(mapper.corrchk(vo.crre_name, vo.crre_code, vo.crre_number)!=0) {
			req.setAttribute("chk", "실패");
		}else {
			mapper.insert((CorrepondentVO)map.get("jccro"));
		}
		

		return null;
	}

}
