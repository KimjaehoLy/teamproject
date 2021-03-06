package erp.bbb;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import erp.Action;
import erp.jjj.CorrepondentVO;

@Service("marketingchkData4")
public class DeadLineChk implements Action {

	@Resource
	DeadLineMapper mapper;

	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest req) {

		String res1 = (String) mapper.chk1(((CorrepondentVO) map.get("jccro")).getCrre_name());
		String res2 = (String) mapper.chk2(((DeadLineVO) map.get("dvo")).getOrder_num4());

		
		int res = 0;

		if (res1 != null && res2 == null)
			res = 1;
		else if (res1 != null && res2 != null) {
			res = 2;
		}else if(res1 == null && res2 == null){
			res = 3;
		}

		return res;
	}

}
