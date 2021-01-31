package erp.bbb;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import erp.Action;

@Service("deadlineinputReg")
public class DeadLineIntputReg implements Action {

	@Resource
	DeadLineMapper mapper;

	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest req) {

		mapper.insert(map.get("dvo"));
		return req;
	}

}
