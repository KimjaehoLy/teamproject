package erp.hhh;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import erp.Action;


@Service("taxdetail")
public class TaxDetail implements Action{
	
	@Resource
	UserMapper mapper;
	
	@Resource
	AttendanceMapper attMapper;

	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest req) {
		System.out.println("TaxDetail execute() 실행");
		
		UserVO user_vo = (UserVO)map.get("user");
		System.out.println("확인 : " + user_vo);

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
			new HyunSuShow().calc(user_vo);
		}
		return user_vo;
	}

}
