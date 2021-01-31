package erp.aaa;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import erp.Action;


@Service("searchmodify")
public class SearchModify implements Action{

	@Resource
	QlTestMapper mapper;
	
	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest req) {
		
		QlTestVO vo = (QlTestVO)map.get("aaqv");
		
		return mapper.detail(vo.pdcode);
	}

}
