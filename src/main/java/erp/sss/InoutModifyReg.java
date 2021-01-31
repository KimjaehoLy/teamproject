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


@Service("inoutschmodifyreg")
public class InoutModifyReg implements Action{
	
	@Resource
	InvenMapper mapper;
	
	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest req) {
		
		System.out.println("inoutsch/modifyReg execute() 실행");

		Inven_outVO vo = (Inven_outVO)map.get("ssov");
		//ComissionVO vo = (ComissionVO)map.get("cvo");
		
		mapper.outmodify(vo);
		mapper.outchkmodify(vo);	// 출고시 재고수량에서 출고수량 마이너스
		mapper.outqttmodify(vo);	// 출고시 의뢰수량에서 출고수량 마이너스
		req.setAttribute("param", vo.getCode());
		//req.setAttribute("param", vo.getOrder_num2());
		
		return req;
	}

}
