package erp.bbb;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import erp.Action;
import erp.SearchVO;

@Service("processingsearchF")
public class ProcessingSearchF implements Action{
	
	@Resource
	ProcessingMapper mapper;

	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest req) {
		SearchVO pag = (SearchVO)map.get("servo");
		ProcessingVO pvo = (ProcessingVO)map.get("pvo");

		pag.setSearch1(pvo.o2);
		pag.setSearch2(pvo.customer);
		
		SearchVO ssv = new SearchVO();
		ssv.setSearch1(pvo.o2);
		ssv.setSearch2(pvo.customer);

		
		int nowPage = 1;
		int pageLimit = 5;
		int pageNumLimit = 4;
		
		if(pag.getNowPage()!=null)
			nowPage = pag.getNowPage();

		int lastPage = (int)Math.ceil(mapper.searchCntF(ssv)/pageLimit)+1;
	
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
		
		req.setAttribute("search1", pag.getSearch1());
		req.setAttribute("search2", pag.getSearch2());
		
		
		ssv.setSearchstart(start);
		ssv.setSearchend(end);;
		

		return mapper.searchF(ssv);
	}

}
