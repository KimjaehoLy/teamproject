package erp.bbb;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import erp.Action;

@Service("collectinputReg")
public class CollectInputReg implements Action {

	@Resource
	CollectMapper mapper;

	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest req) {

		mapper.insert(map.get("clvo"));
		return req;
	}

}
