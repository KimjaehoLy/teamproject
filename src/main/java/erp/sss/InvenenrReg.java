package erp.sss;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import erp.Action;


@Service("invenenrreg")
public class InvenenrReg implements Action{

	@Resource
	InvenMapper mapper;
	
	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest req) {
		
		System.out.println("invenenr/reg execute() 실행");
		
		mapper.insert((InvenVO)map.get("ssiv"));

		return null;
	}

}
