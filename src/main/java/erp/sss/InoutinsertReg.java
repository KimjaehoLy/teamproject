package erp.sss;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import erp.Action;

@Service("inoutinsertreg")
public class InoutinsertReg implements Action{

	@Resource
	InvenMapper mapper;
	
	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest req) {
		
		System.out.println("inoutinsert/reg execute() 실행");
		mapper.outinsert((Inven_outVO)map.get("ssov"));
		
		return req;
	}

}
