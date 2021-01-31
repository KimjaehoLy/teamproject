package erp.hhh;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import erp.Action;


@Service("membersjoin")
public class MembersJoin implements Action{

	@Resource
	UserMapper mapper;
	
	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest request) {
		
		UserVO vo = (UserVO)map.get("user");
		return null;
	}

}
