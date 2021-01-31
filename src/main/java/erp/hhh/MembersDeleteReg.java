package erp.hhh;


import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import erp.Action;

@Service("membersdeleteReg")
public class MembersDeleteReg implements Action{
	
	@Resource
	UserMapper mapper;
	
	@Resource
	AttendanceMapper attMapper;

	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest request) {
		System.out.println("델리트 들어왔다.");
		
		UserVO param_vo = (UserVO)map.get("user");
		
		Integer check = mapper.user_delete(param_vo);
		request.setAttribute("redirect", "members/list");
		
		check = attMapper.att_delete(param_vo);
		
		System.out.println("체크 : " + check );
		
			
		return check;
	}
	
	

}
