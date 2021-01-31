package erp.page;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import erp.Action;
import erp.hhh.HyunSuShow;

@Service("mypagemypage")
public class Mypage implements Action {

	@Resource
	MypageMapper mapper;

	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest req) {
		
		MypageVO vo = mapper.page_detail(map.get("page"));
		
		vo.setUser_pw(new HyunSuShow().decrypt(vo.getUser_pw()));
		
		return vo;
	}

}
