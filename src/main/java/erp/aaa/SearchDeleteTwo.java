package erp.aaa;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import erp.Action;

@Service("searchdeletetwo")
public class SearchDeleteTwo implements Action {
	@Resource
	QlTestMapper mapper;
	
	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest req) {
		
		String[] list = req.getParameterValues("list");
		
		int size = list.length;
		
		
		
		for (int i = 0; i < size; i++) {
			mapper.deletetwo(list[i]);
			
		}
		
		return null;
	}

}
