package erp.sss;

import java.util.HashMap;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import erp.Action;
import erp.SearchVO;


@Service("invenstalist")
public class InvenstaList implements Action{

	
	@Resource
	InvenMapper mapper;
	
	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest req) {
		
		
		SearchVO pag = (SearchVO)map.get("servo");
		
		int nowPage = 1;
		int pageLimit = 10;
		int pageNumLimit = 5;
		
		if(pag.getNowPage()!=null)
			nowPage = pag.getNowPage();

		int lastPage = (int)Math.ceil(mapper.totalCnt(pag)/pageLimit)+1;
	
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
		System.out.println(mapper.list(start, end));
		System.out.println("invensta/list execute() 실행");
		
		return mapper.list(start, end);
	}

}
