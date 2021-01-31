package erp.jjj;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import erp.Action;
import erp.SearchVO;

@Service("correpondentsearch")
public class CorrepondentSearch implements Action{
	
	@Resource
	CorrepondentMapper mapper;

	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest req) {
		SearchVO pag = (SearchVO)map.get("servo");
		CorrepondentVO jccro = (CorrepondentVO)map.get("jccro");
		pag.setSearch(jccro.crre_code); 

		
		int nowPage = 1;
		int pageLimit = 7;
		int pageNumLimit = 4;
		
		if(pag.getNowPage()!=null)
			nowPage = pag.getNowPage();

		int lastPage = (int)Math.ceil(mapper.searchCnt(pag)/pageLimit)+1;
	
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
		req.setAttribute("pageLimit", pageLimit);
		pag.setSearchstart(start);
		pag.setSearchend(end);

		return mapper.search(pag);
	}

}
