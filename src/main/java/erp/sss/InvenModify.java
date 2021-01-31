package erp.sss;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import erp.Action;


@Service("invenlookupmodify")
public class InvenModify implements Action{
	
	@Resource
	InvenMapper mapper;
	
	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest req) {
		
		System.out.println("invenlookup/modify execute() 실행");

		InvenVO vo = (InvenVO)map.get("ssiv");

		return mapper.detail(vo.code);
	}

}
