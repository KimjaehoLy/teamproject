package erp;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import erp.hhh.AttendanceMapper;
import erp.hhh.AttendanceVO;
import erp.hhh.UserVO;
import erp.jjj.AcsubjectVO;
import erp.jjj.CorrepondentVO;
import erp.jjj.JournalVO;
import erp.model.Aside;
import erp.model.Kind;
import erp.page.MypageVO;
import erp.page.NoteVO;
import erp.sss.InvenVO;
import erp.sss.Inven_outVO;


@Controller
@RequestMapping("/template/{cate}/{menu}/{service}")
public class ErpController {

	@Resource
    AttendanceMapper attMapper;
	
	@Resource					//무조건 가져오겠다
	MyProvider provider;
	
	@ModelAttribute
    Kind kind(
            @PathVariable("cate")String cate,
            @PathVariable("menu")String menu,
            @PathVariable("service")String service,
            HttpServletRequest request
            ) {
        Kind kind = new Kind();
        kind.setCate(cate);
        kind.setMenu(menu);
        kind.setService(service);
        kind.setMainUrl(cate+"/"+menu+"/"+service+".jsp");
        kind.setAsideUrl("aside/aaside");
        
        if(menu.equals("status") || menu.equals("mypage"))
            kind.setMainUrl("public/"+menu+"/"+service+".jsp");
        
        return kind;
    }

	@ModelAttribute("asideGo")    //관리별로 aside에 이동할 페이지 저장 
	    ArrayList<String[]> asideGo(@PathVariable("cate")String cate){
	    Aside aside =  new Aside();
	
	    ArrayList<String[]> menu =  aside.aside(cate);

	    return menu;
    }
	
   
    @ModelAttribute("stat")
     String stat(HttpServletRequest req) {

         UserVO vo = (UserVO)req.getSession().getAttribute("mydata");

         String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
         HashMap<String, Object> paramMap = new HashMap<String, Object>();
         paramMap.put("vo", vo);
         paramMap.put("today", today);

         AttendanceVO att = attMapper.att_status(vo.getUser_num(), today);


         System.out.println(att);
         if(att == null)
             return "출근";

         return "퇴근";
     }
    @ModelAttribute("dateParam")
    String dateParam(HttpServletRequest req, AttendanceVO att) {
        String res = "";

        if(att.searchDay != null) {
            res = "searchDay=" + att.getSearchDay()[0] + "&searchDay=" + att.getSearchDay()[1] + "&searchDay=1";
            req.setAttribute("dateYear", att.getSearchDay()[0]);
            req.setAttribute("dateMonth", att.getSearchDay()[1]);
        }

        return res; 
    }
	    
	@ModelAttribute("data")
	Object mainData(
			SearchVO servo,
			//현빈
			QlTestVO aaqv, 
			QlTestHistoryVO aaqw,
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
			MypageVO page,
			NoteVO note,
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
		map.put("jccro", jccro);
		map.put("jacvo", jacvo);
		map.put("aaqv", aaqv);
		map.put("aaqw", aaqw);
		map.put("servo", servo);
		map.put("ssiv", ssiv);
		map.put("scvo", scvo);
		map.put("att", att);
		map.put("svo", svo);
		map.put("cvo", cvo);
		map.put("dvo", dvo);
		map.put("page", page);
		map.put("note", note);
		map.put("pvo", pvo);
		map.put("clvo", clvo);
		map.put("user", user);
		map.put("ssiv", ssiv);
		map.put("ssov", ssov);
		
		Object res = action.execute(map, req);
		return res;
	}
	
	
	@RequestMapping
	String view() {		
		return "template";
	}
}
