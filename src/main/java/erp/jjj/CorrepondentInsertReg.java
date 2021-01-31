package erp.jjj;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import erp.Action;


@Service("correpondentinsertreg")
public class CorrepondentInsertReg implements Action{

	@Resource
	CorrepondentMapper mapper;
	
	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest req) {		
		return null;
	}

}
