package erp.jjj;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import erp.Action;

@Service("correpondentmodify")
public class CorrepondentModify implements Action{

	
	@Resource
	CorrepondentMapper mapper;

	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest req) {
		mapper.modify((CorrepondentVO)map.get("jccro"));
		return null;
	}

}
