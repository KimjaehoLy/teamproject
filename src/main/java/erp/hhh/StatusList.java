package erp.hhh;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import erp.Action;
import erp.SearchVO;


@Service("statuslist")
public class StatusList implements Action{

	@Resource
	UserMapper mapper;
	@Resource
	AttendanceMapper attMapper;
	
	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest request) {
		

		System.out.println("StatusList execute() 실행");
		
		UserVO user_vo = (UserVO)map.get("user");
		SearchVO pag = (SearchVO)map.get("servo");
		pag.setSearch1(user_vo.getUser_cate());
		pag.setSearch2(user_vo.getUser_lev());
		pag.setSearch3(user_vo.getUser_name());
		
		String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		ArrayList<Integer> user_nums = (ArrayList<Integer>)attMapper.att_statusList(today);
		System.out.println("today : " + today);
		System.out.println("출근한사람 사원번호 : " + user_nums);

		
		ArrayList<UserVO> users =  (ArrayList<UserVO>)mapper.user_allList(user_vo);
		
		

		
		
		return onOffUser(users, user_nums);
	}
	
	
	HashMap<Object, Object> onOffUser(ArrayList<UserVO> users, ArrayList<Integer> user_nums) {
		ArrayList<UserVO> onUser = new ArrayList<UserVO>();
		ArrayList<UserVO> offUser = new ArrayList<UserVO> ();
		HashMap<Object, Object> sub = new HashMap<Object, Object>();
		
		for (Integer num : user_nums) {
				sub.put(num, null);
		}
		
		
		for (UserVO user : users) {
			System.out.println(user_nums + " : " + user.getUser_num());
			if(sub.containsKey(user.getUser_num())) { 
				onUser.add(user);
			}
			else {
				offUser.add(user);
			}
		}
		System.out.println("온라인 : " + onUser);
		System.out.println("오프라인 : " + offUser);
		sub.put("onUser", onUser);
		sub.put("offUser", offUser);
		return sub;
		
	}

}
