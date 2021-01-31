package erp.aaa;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import erp.Action;


@Service("searchmodifyreg")
public class SearchModifyReg implements Action{

	@Resource
	QlTestMapper mapper;
	
	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest req) {
		
		QlTestVO vo = (QlTestVO)map.get("aaqv");
		
				
		mapper.searchmodify(vo);
		req.setAttribute("param", vo.getPdcode());		
		return req;
	}

}
