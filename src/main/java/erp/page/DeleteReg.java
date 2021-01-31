package erp.page;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import erp.Action;

@Service("mypagedeleteReg")
public class DeleteReg implements Action {

	@Resource
	NoteMapper mapper;

	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest req) {
		mapper.delete(map.get("note"));
		return null;
	}

}
