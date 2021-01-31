package erp.sss;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import erp.Action;


@Service("inoutschdelete")
public class inoutDelete implements Action{

	@Resource
	InvenMapper mapper;
	
	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest req) {
		
		//System.out.println(((InvenVO)map.get("ssiv")).code==null);
		System.out.println("inoutdelete/delete execute() 실행");

		mapper.outdelete((Inven_outVO)map.get("ssov"));
		
		return null;
	}

}
