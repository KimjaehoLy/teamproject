package erp.hhh;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import erp.Action;


@Service("salarymodifyReg")
public class SalaryModifyReg implements Action{

	@Resource
	UserMapper mapper;
	
	@Resource
	AttendanceMapper attMapper;
	
	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest request) {
		System.out.println("수정하러 들어왔습니다.");
		
		// 유저 vo 가져옴
		UserVO vo = (UserVO)map.get("user");
		
		// 월급수정하고
		Integer chk = mapper.user_salModify(vo);
		System.out.println("수정됬나 확인 : " + chk);
		
		//디테일 가져오고
		vo = mapper.user_detail(vo.getUser_id());
		
		// att에서도 월급수정하러감
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("vo", vo);
//		System.out.println(vo);
		//달의 첫날과 마지막날 가져옴
		String[] startEndDay = new HyunSuShow().startEndDay((AttendanceVO)map.get("att"));
		paramMap.put("start_time", startEndDay[0]);
		paramMap.put("end_time", startEndDay[1]);
		
		chk = attMapper.att_salModify(paramMap);
		
		System.out.println("att 월급 수정 확인 : " + chk);
		
		request.setAttribute("redirect", "members/detail?user_id=" + vo.getUser_id());
		return null;
	}

}
