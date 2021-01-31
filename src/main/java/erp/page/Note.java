package erp.page;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import erp.Action;
import erp.SearchVO;
import erp.hhh.UserMapper;

@Service("mypagenote")
public class Note implements Action {

	@Resource
	NoteMapper mapper;

	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest req) {
		NoteVO nvo = (NoteVO)map.get("note");
		SearchVO pag = (SearchVO)map.get("servo");
		
		int nowPage = 1;
		int pageLimit = 7;
		int pageNumLimit = 4;
		
		if(pag.getNowPage()!=null)
			nowPage = pag.getNowPage();

		int lastPage = (int)Math.ceil(mapper.totalCnt(nvo)/pageLimit)+1;
	
		int start = (nowPage-1)*pageLimit+1;
	
		int end = nowPage*pageLimit;
	
		
		int startPage = (nowPage-1)/pageNumLimit*pageNumLimit+1;
	
		int endPage = startPage+pageNumLimit-1;
	
		
		if(endPage>lastPage)
			endPage=lastPage;
		
		pag.setSearch(nvo.tou);
		pag.setSearchstart(start);
		pag.setSearchend(end);
		
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("nowPage", nowPage);
		req.setAttribute("lastPage", lastPage);
		req.setAttribute("pageLimit", pageLimit);
		
		
		return mapper.list(pag);
	}

}
