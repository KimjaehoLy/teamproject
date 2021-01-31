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


@Service("invenlookuplist")
public class InvenlookupList implements Action{
	
	@Resource
	InvenMapper mapper;
	
	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest req) {
	
		InvenVO vo = (InvenVO)map.get("ssiv");
		SearchVO pag = (SearchVO)map.get("servo");
		
		System.out.println(vo.code);
		
		pag.setSearch(vo.code);
		pag.setSearch1(vo.name);
		pag.setSearch2(vo.possi);

		int nowPage = 1;
		int pageLimit = 8;
		int pageNumLimit = 5;
		
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
		pag.setSearchstart(start);
		pag.setSearchend(end);
		
		req.setAttribute("vo", pag);
		
		System.out.println("invxenlookup/list execute() 실행");

		return mapper.listSch(pag);
	}

}
