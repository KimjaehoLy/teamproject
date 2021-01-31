package erp.aaa;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import erp.Action;

@Service("historydelete")
public class HistoryDelete implements Action {
	@Resource
	QlTestHistoryMapper mapper;
	
	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest req) {
		QlTestHistoryVO vo = (QlTestHistoryVO)map.get("aaqw");

		String url = "redirect:delete?pdcode="+vo.getPdcode();
		
		if(mapper.historydelete(vo)>0) { //삭제시 0  비정상시 0 < ? 
			url = "list";
		}
		req.setAttribute("url", url);			
		
		
		
		return null;
	}

}
