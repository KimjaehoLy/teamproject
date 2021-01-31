package erp.bbb;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import erp.Action;

@Service("deadlinedeleteReg")
public class DeadLineDeleteReg implements Action {

	@Resource
	DeadLineMapper mapper;

	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest req) {

		mapper.delete(map.get("dvo"));
		return req;
	}

}
