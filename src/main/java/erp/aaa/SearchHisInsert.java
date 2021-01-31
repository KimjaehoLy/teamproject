package erp.aaa;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import erp.Action;


@Service("searchhisinsert")
public class SearchHisInsert implements Action{

	@Resource
	QlTestMapper mapper;
	
	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest req) {
		
		mapper.searchhisinsert((QlTestVO)map.get("aaqv"));
		
		mapper.delete((QlTestVO)map.get("aaqv"));
			
		req.setAttribute("url", "../history/list");
		
		return req;
	}
	
}
