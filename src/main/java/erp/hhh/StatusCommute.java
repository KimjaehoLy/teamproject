package erp.hhh;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import erp.Action;

@Service("joinstatusChk")
public class StatusCommute implements Action{
	
	@Resource
	AttendanceMapper attMapper;

	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest req) {
		
		System.out.println("statuscommuteReg execute() 실행");
		System.out.println("statuscommuteReg.java/출퇴근 기록 하러 들어옴");
		
		
		String chk = req.getParameter("chk");
		System.out.println("chk : " + chk);
		
		UserVO vo = (UserVO)req.getSession().getAttribute("mydata");
		
		
		HashMap<String, Object> paramMap = new HyunSuShow().nowSalery(vo);
		
		vo.setUser_pay(((AttendanceVO)((List<AttendanceVO>)attMapper.att_detailPay(paramMap)).get(0)).getAtt_pay());
		
		switch (chk) {
		case "출근":
			System.out.println("출근 데이타 삽입 : " + attMapper.att_startTime(paramMap));
			break;
		case "퇴근":
			System.out.println("퇴근 타이타 삽입 : " + attMapper.att_endTime(paramMap));
			break;		
		}
		
		
		
		return chk;
	}
	
	

}
