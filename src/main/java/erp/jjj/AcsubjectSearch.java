package erp.jjj;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import erp.Action;
import erp.SearchVO;

@Service("acsubjectsearch")
public class AcsubjectSearch implements Action{
	
	@Resource
	AcsubjectMapper mapper;

	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest req) {
		SearchVO pag = (SearchVO)map.get("servo");
		AcsubjectVO acvo = (AcsubjectVO)map.get("jacvo");
		System.out.println("어디3");
		pag.setSearch(acvo.accsu_code);


		
		int nowPage = 1;
		int pageLimit = 10;
		int pageNumLimit = 7;
		
		if(pag.getNowPage()!=null)
			nowPage = pag.getNowPage();

		int lastPage = (int)Math.ceil(mapper.searchCnt(pag)/pageLimit)+1;
	
		int start = (nowPage-1)*pageLimit+1;
	
		int end = nowPage*pageLimit;
	
		
		int startPage = (nowPage-1)/pageNumLimit*pageNumLimit+1;
	
		int endPage = startPage+pageNumLimit-1;
	
		
		if(endPage>lastPage)
			endPage=lastPage;
		
		System.out.println("어디1");
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("nowPage", nowPage);
		req.setAttribute("lastPage", lastPage);
		pag.setSearchstart(start);
		pag.setSearchend(end);
		System.out.println("어디2");
		return mapper.search(pag);
	}

}
