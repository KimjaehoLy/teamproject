package erp.bbb;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import erp.Action;

@Service("comissionupdateReg")
public class ComissionUpdateReg implements Action {

	@Resource
	ComissionMapper mapper;

	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest req) {
		mapper.update(map.get("cvo"));
		return null;
	}

}
