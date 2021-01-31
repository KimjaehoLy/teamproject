package erp.sss;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import erp.Action;
import erp.SearchVO;
import erp.bbb.ComissionMapper;
import erp.bbb.ComissionVO;


@Service("inoutschmodify")
public class InoutModify implements Action{
   
   @Resource
   ComissionMapper comapper;
   
   @Resource
   InvenMapper mapper;
   
   @Override
   public Object execute(HashMap<String, Object> map, HttpServletRequest req) {
      
      System.out.println("inoutsch/modify execute() 실행");
      
      
      ComissionVO vo = (ComissionVO)map.get("cvo");
      
      System.out.println("불러온 값 = " + vo.getOrder_num2());
      
      
      SearchVO pag = (SearchVO)map.get("servo");
      System.out.println(pag.getSearch());
      
      
		
		int nowPage = 1;
		int pageLimit = 8;
		int pageNumLimit = 5;
		
		if(pag.getNowPage()!=null)
			nowPage = pag.getNowPage();

		int lastPage = (int)Math.ceil(mapper.outinCnt(pag)/pageLimit)+1;
	
		int start = (nowPage-1)*pageLimit+1;
	
		int end = nowPage*pageLimit;
	
		
		int startPage = (nowPage-1)/pageNumLimit*pageNumLimit+1;
	
		int endPage = startPage+pageNumLimit-1;
	
		
		if(endPage>lastPage)
			endPage=lastPage;
	
		
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("nowPage", nowPage);
		req.setAttribute("lastPage", lastPage);
		pag.setSearchstart(start);
		pag.setSearchend(end);
		req.setAttribute("sub", mapper.outindetail(pag));
		System.out.println(pag.getSearchstart());
	    System.out.println(pag.getSearchend());
		System.out.println("inoutModify/list execute() 실행");
		System.out.println("잘 봐바봐라 " + mapper.invenimpomodify(vo.getOrder_num2()));

      return mapper.invenimpomodify(vo.getOrder_num2());

   }

}