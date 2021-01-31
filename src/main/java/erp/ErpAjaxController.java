package erp;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import erp.aaa.QlTestHistoryVO;
import erp.aaa.QlTestVO;
import erp.bbb.CollectVO;
import erp.bbb.ComissionVO;
import erp.bbb.DeadLineVO;
import erp.bbb.ProcessingVO;
import erp.bbb.SpecVO;
import erp.bbb.SujuVO;
import erp.eee.InformationVO;
import erp.hhh.AttendanceVO;
import erp.hhh.UserVO;
import erp.jjj.AcsubjectVO;
import erp.jjj.CorrepondentVO;
import erp.jjj.JournalVO;
import erp.sss.InvenVO;
import erp.sss.Inven_outVO;


@Controller
@RequestMapping("/ajax/{cate}/{menu}/{service}")
public class ErpAjaxController {
	
	
	@Resource					//무조건 가져오겠다
	MyProvider provider;

	@ModelAttribute("data")
	Object mainData(
			SearchVO servo,
			//현빈
			QlTestVO aaqv, 
			QlTestHistoryVO aaqw,
			InformationVO info,
			//재호
			JournalVO jjouv, 		
			AcsubjectVO jacvo,
			CorrepondentVO jccro,
			//현수
			UserVO user, 
			AttendanceVO att,
			//찬범
			SujuVO svo,
			CollectVO clvo,
			DeadLineVO dvo,
			SpecVO scvo,
			ProcessingVO pvo,
			ComissionVO cvo,
			//상금
			InvenVO ssiv,
			Inven_outVO ssov,

			@PathVariable("menu")String menu,
			@PathVariable("service")String service,
			HttpServletRequest req
			
			) {
		System.out.println("mainData() 실행");
		
		Action action = provider.getContext().getBean(menu+service,Action.class);

		HashMap<String, Object> map = new HashMap<>();

		map.put("jjouv",jjouv);
		map.put("aaqv", aaqv);
		map.put("aaqw", aaqw);
		map.put("ssiv", ssiv);
		map.put("svo", svo);
		map.put("scvo", scvo);
		map.put("servo", servo);
		map.put("jccro", jccro);
		map.put("cvo", cvo);
		map.put("dvo", dvo);
		map.put("pvo", pvo);
		map.put("clvo", clvo);
		map.put("user", user);
		map.put("ssiv", ssiv);
		map.put("ssov", ssov);
			
		Object res = action.execute(map, req);
		return res;
	}
	
	@RequestMapping
	String view(
			@PathVariable("cate")String cate,
            @PathVariable("menu")String menu,
            @PathVariable("service")String service
			) {		
		return "ajax/"+cate+"/"+menu+"/"+service;
	}
}
