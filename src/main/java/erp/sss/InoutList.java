package erp.sss;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import erp.Action;
import erp.SearchVO;


@Service("inoutlist")
public class InoutList implements Action{

	@Resource
	InvenMapper mapper;
	
	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest req) {
		
		Inven_outVO vo = (Inven_outVO)map.get("ssov");
		SearchVO pag = (SearchVO)map.get("servo");
		
		System.out.println(vo.getOutno());
		
		pag.setSearch(vo.getOutno());
		pag.setSearch1(vo.getOutch());
		
		int nowPage = 1;
		int pageLimit = 8;
		int pageNumLimit = 5;
		
		if(pag.getNowPage()!=null)
			nowPage = pag.getNowPage();

		int lastPage = (int)Math.ceil(mapper.outtotalCnt(pag)/pageLimit)+1;
	
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
		
		System.out.println("inout/list execute() 실행");
		
		return mapper.outlist(pag);
	}
}
