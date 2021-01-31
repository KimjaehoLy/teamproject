package erp.sss;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import erp.Action;


@Service("inveninsertreg")
public class InveninsertReg implements Action{

	@Resource
	InvenMapper mapper;
	
	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest req) {
		
		System.out.println("inveninsert/reg execute() 실행");
		mapper.insert((InvenVO)map.get("ssiv"));
		
		return req;
	}

}
