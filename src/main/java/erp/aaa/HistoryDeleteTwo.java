package erp.aaa;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import erp.Action;


@Service("historydeletetwo")
public class HistoryDeleteTwo implements Action {
	@Resource
	QlTestHistoryMapper mapper;
	
	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest req) {
		
		
		String[] list = req.getParameterValues("list");
		
		int size = list.length;
		

		
		for (int i = 0; i < size; i++) {
			mapper.historydeletetwo(list[i]);
			
		}
		
		return null;
	}

}
