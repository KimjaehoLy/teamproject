package erp.hhh;

import java.util.ArrayList;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import erp.Action;


@Service("attendancedetail")
public class AttendanceDetail implements Action{

	@Resource
	UserMapper mapper;
	
	@Resource
	AttendanceMapper attMapper;
	
	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest request) {
		System.out.println("SalaryDetail execute() 실행");
		
		//파라미터로 넘어온 사원 정보를 객체에 담는다.
		UserVO user_vo = (UserVO)map.get("user");
//		System.out.println("확인 : " + user_vo);
		
		//파라미터로 넘어온 사원 정보를 가지고 데이터 베이스에서 찾는다
		user_vo = (UserVO) mapper.user_detail(user_vo.getUser_id());
		
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("user_num", user_vo.getUser_num());
		String[] startEndDay = new HyunSuShow().startEndDay((AttendanceVO)map.get("att"));
		paramMap.put("start_time", startEndDay[0]);
		paramMap.put("start_end", startEndDay[1]);
		
		ArrayList<AttendanceVO> attendance_vo = (ArrayList<AttendanceVO>) attMapper.att_detail(paramMap);
		user_vo.setAttendace(attendance_vo);
		if(attendance_vo != null && attendance_vo.size() != 0) {
			user_vo.setUser_pay(attendance_vo.get(0).getAtt_pay()); 
		}
		return user_vo;
	}

}
