package erp.page;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import erp.Action;
import erp.hhh.HyunSuShow;

@Service("mypagemodReg")
public class MypageMod implements Action {

	@Resource
	MypageMapper mapper;

	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest req) {
		
		MypageVO vo = (MypageVO)map.get("page");
		//암호화
		vo.setUser_pw(new HyunSuShow().encrypt(vo.getUser_pw()));
		mapper.page_modify(vo);
		//복호화
		vo.setUser_pw(new HyunSuShow().decrypt(vo.getUser_pw()));
		return mapper.page_detail(vo);
	}

}
