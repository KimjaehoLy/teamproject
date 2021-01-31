package erp.hhh;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import erp.Action;


@Service("salarymodify")
public class SalaryModify implements Action{

	@Resource
	UserMapper mapper;
	
	@Resource
	AttendanceMapper attMapper;
	
	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest request) {
		
		UserVO vo = (UserVO)map.get("user");
		vo = mapper.user_detail(vo.getUser_id());
		
		
		
		HashMap<String, Object> paramMap = new HyunSuShow().nowSalery(vo);
		ArrayList<AttendanceVO> attendance_vo = (ArrayList<AttendanceVO>) attMapper.att_detail(paramMap);
		vo.setAttendace(attendance_vo);
		if(attendance_vo != null && attendance_vo.size() != 0) {
			vo.setUser_pay(attendance_vo.get(0).getAtt_pay());
		}
		
		return vo;
	}

}
