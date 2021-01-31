package erp.hhh;

import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import erp.Action;

@Service("membersjoinReg")
public class MembersJoinReg implements Action {

	@Resource
	UserMapper mapper;
	
	@Resource
	AttendanceMapper attMapper;

	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest request) {
		System.out.println("인설트 들어왔다.");

		UserVO param_vo = (UserVO) map.get("user");
		
		//파일업로드
		new HyunSuShow().fileUpload(param_vo.getUser_upfile(), request);
		
		//페스워드 암호화
		param_vo.setUser_pw(new HyunSuShow().encrypt(param_vo.getUser_pw()));
		
		//인설트 sql
		Integer check = mapper.user_insert(param_vo);
		
		//아이디 만들면 그날은 출석 할꺼임
		HashMap<String, Object> paramMap = new HyunSuShow().nowSalery(param_vo);
		attMapper.att_startTime(paramMap);
		
		//리다이렉트
		request.setAttribute("redirect", "members/detail?user_id=" + param_vo.getUser_id());

		System.out.println("체크 : " + check);

		return check;
	}

	

}
