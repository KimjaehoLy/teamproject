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
import erp.bbb.ComissionVO;


@Service("inoutschlist")
public class InoutschList implements Action{

	
	@Resource
	InvenMapper mapper;
	
	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest req) {
		
		ComissionVO vo = (ComissionVO)map.get("cvo");
		SearchVO pag = (SearchVO)map.get("servo");
		
		System.out.println(vo.getOrder_num2());

		pag.setSearch(vo.getOrder_num2());
		pag.setSearch1(vo.getKind());

		int nowPage = 1;
		int pageLimit = 6;
		int pageNumLimit = 5;
		
		if(pag.getNowPage()!=null)
			nowPage = pag.getNowPage();

		int lastPage = (int)Math.ceil(mapper.outsearchCnt(pag)/pageLimit)+1;
	
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
	
		req.setAttribute("vo", pag);
		
		System.out.println("inoutsch/list execute() 실행");

		return mapper.outlistSch(pag);
	}

}
