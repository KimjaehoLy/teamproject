package erp.sss;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Service;

import erp.Action;
import erp.jjj.CorrepondentVO;

@Service("invenenrmodifyChk")
public class modifyChk implements Action{
	
	@Resource
	InvenMapper mapper;

	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest req) {

		//String a = ((InvenVO)map.get("ssiv")).getCode();
		String b = ((CorrepondentVO)map.get("jccro")).getCrre_name();
		
		//Integer chkcode = mapper.codeChk(a);
		Integer chkclient = mapper.clientChk(b);
		
		//System.out.println("체크코드" + chkcode);
		System.out.println("체크클라이언트" + chkclient);
		
		String res = "[{\"chkclient\":"+chkclient+"}]";
		return res;
	}

}
