package erp.hhh;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import erp.Action;


@Service("membersmodify")
public class MembersModify implements Action{

	@Resource
	UserMapper mapper;
	
	@Resource
	AttendanceMapper attMapper;
	
	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest request) {
		
		UserVO vo = (UserVO)map.get("user");
		vo = mapper.user_detail(vo.getUser_id());
		
		
		HashMap<String, Object> paramMap = new HyunSuShow().nowSalery(vo);
		List<AttendanceVO> attendance_vo =  (List<AttendanceVO>)attMapper.att_detailPay(paramMap);
		
		if(attendance_vo != null && attendance_vo.size() != 0) {
			vo.setUser_pay(attendance_vo.get(0).getAtt_pay());
		}
		
		return vo; 
	}

}
