package erp.page;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import erp.Action;
import erp.hhh.UserMapper;

@Service("mypagesendReg")
public class SendReg implements Action {

	@Resource
	NoteMapper mapper;

	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest req) {
			mapper.insert(map.get("note"));
		return null;
	}

}
