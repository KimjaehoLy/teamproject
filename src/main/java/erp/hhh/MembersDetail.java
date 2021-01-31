package erp.hhh;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import erp.Action;


@Service("membersdetail")
public class MembersDetail implements Action{

	@Resource
	UserMapper mapper;
	
	@Resource
	AttendanceMapper attMapper;
	
	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest request) {
		
		UserVO vo = (UserVO)map.get("user");
		
		vo = mapper.user_detail(vo.getUser_id());
		
		HashMap<String, Object> paramMap = new HyunSuShow().nowSalery(vo);
		
		vo.setUser_pay(((AttendanceVO)((List<AttendanceVO>)attMapper.att_detailPay(paramMap)).get(0)).getAtt_pay());
		
		// 패스워드 복호화
		vo.setUser_pw(new HyunSuShow().decrypt(vo.getUser_pw()));
		
		return vo;
	}

}
