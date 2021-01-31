package erp.bbb;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import erp.Action;

@Service("sujuupdateReg")
public class SujuUpdateReg implements Action {

	@Resource
	SujuMapper mapper;

	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest req) {
		mapper.update(map.get("svo"));
		return null;
	}

}
