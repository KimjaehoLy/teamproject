package erp.sss;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import erp.Action;


@Service("invenlookupdelete")
public class invenlookupdelete implements Action{

	@Resource
	InvenMapper mapper;
	
	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest req) {
		
		//System.out.println(((InvenVO)map.get("ssiv")).code==null);
		System.out.println("invenlookupdelete/delete execute() 실행");

		mapper.delete((InvenVO)map.get("ssiv"));
		
		return null;
	}

}
