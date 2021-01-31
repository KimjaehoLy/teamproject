package erp.page;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import erp.Action;
import erp.hhh.UserVO;

@Service("mypagenoteDetail")
public class NoteDetail implements Action{

	@Resource
	NoteMapper mapper;

	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest req) {
		NoteVO vo = (NoteVO)map.get("note");
		NoteVO detail = mapper.detail(vo);
		if(((UserVO)req.getSession().getAttribute("mydata")).getUser_id().equals(detail.tou))
			mapper.chk(detail);
		
		return detail;
	}
	
}
