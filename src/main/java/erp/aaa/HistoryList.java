package erp.aaa;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import erp.Action;
import erp.SearchVO;



@Service("historylist")
public class HistoryList implements Action{

	@Resource
	QlTestHistoryMapper mapper;
	
	
	
	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest req) {
		QlTestHistoryVO vo = (QlTestHistoryVO)map.get("aaqw");
		SearchVO pag = (SearchVO)map.get("servo");
		
		pag.setSearch1(vo.pdcode);
		pag.setSearch2(vo.qlpdname);
		pag.setSearch3(vo.qlstate);
		
		
		int nowPage = 1;
		int pageLimit = 7;
		int pageNumLimit = 6;
		
		if(pag.getNowPage()!=null)
			nowPage = pag.getNowPage();

		int lastPage = (int)Math.ceil(mapper.totalCnt4(pag)/pageLimit)+1;
	
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
		
		return mapper.historylistSch(pag);
	}

}
