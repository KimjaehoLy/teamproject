package erp.aaa;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import erp.Action;

@Service("searchdelete")
public class SearchDelete implements Action {
	@Resource
	QlTestMapper mapper;
	
	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest req) {
		QlTestVO vo = (QlTestVO)map.get("aaqv");
		
		String url = "redirect:delete?pdcode="+vo.getPdcode();
		
		if(mapper.delete(vo)>0) { //삭제시 0  비정상시 0 < ? 
			url = "list";
		}
		req.setAttribute("url", url);			
		
		
		
		return url;
	}

}
