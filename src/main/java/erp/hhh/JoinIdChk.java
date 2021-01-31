package erp.hhh;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import erp.Action;

@Service("joinidChk")
public class JoinIdChk implements Action{
	
	@Resource
	UserMapper mapper;

	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest req) {
		UserVO vo = (UserVO)map.get("user");
		
		System.out.println(vo);
		
		Integer chk = mapper.joinIdChk(vo);
		
		System.out.println("중복확인 : " + chk);
//		req.setAttribute("chk", chk);
		
		return chk;
	}

}
