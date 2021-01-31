package erp.sss;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import erp.Action;


@Service("invenlookupdetail")
public class InvenDetail implements Action{

	@Resource
	InvenMapper mapper;
	
	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest req) {
		InvenVO vo = (InvenVO)map.get("ssiv");
		
		System.out.println("invenlookup/detail execute() 실행");
		
		return mapper.detail(vo.code);
	}

}
