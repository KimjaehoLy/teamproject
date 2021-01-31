package erp.aaa;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import erp.Action;


@Service("historydetail")
public class HistoryDetail implements Action{

	@Resource
	QlTestHistoryMapper mapper;
	
	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest req) {
		QlTestHistoryVO vo = (QlTestHistoryVO)map.get("aaqw");
		
		
		return mapper.historydetail(vo.pdcode);
	}

}
