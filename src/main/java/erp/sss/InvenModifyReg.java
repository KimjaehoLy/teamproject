package erp.sss;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import erp.Action;


@Service("invenlookupmodifyreg")
public class InvenModifyReg implements Action{
	
	@Resource
	InvenMapper mapper;
	
	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest req) {
		
		System.out.println("invenlookup/modifyReg execute() 실행");

		InvenVO vo = (InvenVO)map.get("ssiv");
		
		mapper.modify(vo);
		System.out.println(vo);
		return req;
	}

}
