package erp.hhh;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import erp.Action;
import erp.SearchVO;


@Service("salarylist")
public class SalaryList implements Action{

	@Resource
	UserMapper mapper;
	
	@Resource
	AttendanceMapper attMapper;
	
	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest request) {

		System.out.println("SalaryList execute() 실행");
		
		AttendanceVO att = (AttendanceVO)map.get("att");
		UserVO user_vo = (UserVO)map.get("user");
		SearchVO pag = (SearchVO)map.get("servo");
		pag.setSearch1(user_vo.getUser_cate());
		pag.setSearch2(user_vo.getUser_lev());
		pag.setSearch3(user_vo.getUser_name());
		
		//페이징 처리
		int nowPage = 1;
		int pageLimit = 6;
		int pageNumLimit = 3;
		
		if(pag.getNowPage()!=null)
			nowPage = pag.getNowPage();

		int lastPage = (int)Math.ceil(mapper.user_listTotCnt(pag)/pageLimit)+1;
	
		int start = (nowPage-1)*pageLimit+1;
	
		int end = nowPage*pageLimit;
	
		
		int startPage = (nowPage-1)/pageNumLimit*pageNumLimit+1;
	
		int endPage = startPage+pageNumLimit-1;
	
		
		if(endPage>lastPage)
			endPage=lastPage;
		
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("lastPage", lastPage);
		
		if(att.searchDay != null) {
			request.setAttribute("atMonth", att.getSearchDay()[1]);
			request.setAttribute("atDay", att.getSearchDay()[2]);
		}
		
		pag.setSearchstart(start);
		pag.setSearchend(end);

		ArrayList<UserVO> user_list = (ArrayList<UserVO>) mapper.user_list(pag);
		
		String[] startEndDay = new HyunSuShow().startEndDay(att);
		ArrayList<AttendanceVO> attendance_vo = (ArrayList<AttendanceVO>) attMapper.att_list(startEndDay[0], startEndDay[1]);

//		System.out.println(user_vo);
//		System.out.println(attendance_vo);

		ArrayList<AttendanceVO> attData = null;

		for (UserVO userVO : user_list) {
			attData = new ArrayList<AttendanceVO>();
			for (AttendanceVO attVO : attendance_vo) {

				if (userVO.getUser_num().equals(attVO.getAtt_num())) {
					attData.add(attVO);
					userVO.setUser_pay(attVO.getAtt_pay());
				}
				userVO.setAttendace(attData);
//				System.out.println(attVO.att_pay + new SimpleDateFormat("yyyy-MM-dd").format(attVO.today));
			}
		}
		System.out.println("확인 : " + user_list);
		return user_list;
	}

}
