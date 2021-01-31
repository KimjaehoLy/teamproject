package erp.sss;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import erp.Action;
import erp.bbb.ComissionVO;


@Service("inoutschdetail")
public class InoutDetail implements Action{

	@Resource
	InvenMapper mapper;
	
	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest req) {
		//Inven_outVO vo = (Inven_outVO)map.get("ssov");
		
		System.out.println("inoutsch/detail execute() 실행");
		ComissionVO vo = (ComissionVO)map.get("cvo");
		
		return mapper.outdetail(vo.getOrder_num2());
	}

}
