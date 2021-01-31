package erp.bbb;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import erp.Action;

@Service("collectupdateReg")
public class CollectUpdateReg implements Action {

	@Resource
	CollectMapper mapper;

	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest req) {
		mapper.update(map.get("clvo"));
		return null;
	}

}
