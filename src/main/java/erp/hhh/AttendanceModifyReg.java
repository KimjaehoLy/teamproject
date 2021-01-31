package erp.hhh;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import erp.Action;

@Service("attendancemodifyReg")
public class AttendanceModifyReg implements Action {

	@Resource
	UserMapper mapper;

	@Resource
	AttendanceMapper attMapper;

	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest request) {

		System.out.println("AttendanceMofidyReg execute() 실행");

		UserVO user_vo = (UserVO)map.get("user");
		AttendanceVO att_vo = (AttendanceVO)map.get("att");
		
		System.out.println("AttModifyReg/attVO.toString : " + att_vo);
		user_vo = mapper.user_detail(user_vo.getUser_id());
		att_vo.setAtt_num(user_vo.getUser_num());
		
		
		attMapper.att_modify(att_vo);
		
		//리다이렉트
		request.setAttribute("redirect", "attendance/detail?user_id=" + user_vo.user_id
				+"&searchDay=" + att_vo.getSearchDay()[0] + "&searchDay=" + att_vo.getSearchDay()[1] + "&searchDay=1");
		
		
		return null;
	}

}
