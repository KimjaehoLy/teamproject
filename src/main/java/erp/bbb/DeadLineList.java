package erp.bbb;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import erp.Action;
import erp.SearchVO;

@Service("deadlinelist")
public class DeadLineList implements Action {

	@Resource
	DeadLineMapper mapper;

	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest req) {

		SearchVO pag = (SearchVO) map.get("servo");

		int nowPage = 1;
		int pageLimit = 5;
		int pageNumLimit = 4;

		if (pag.getNowPage() != null)
			nowPage = pag.getNowPage();

		int lastPage = (int) Math.ceil(mapper.totalCnt() / pageLimit) + 1;

		int start = (nowPage - 1) * pageLimit + 1;

		int end = nowPage * pageLimit;

		int startPage = (nowPage - 1) / pageNumLimit * pageNumLimit + 1;

		int endPage = startPage + pageNumLimit - 1;

		if (endPage > lastPage)
			endPage = lastPage;

		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("nowPage", nowPage);
		req.setAttribute("lastPage", lastPage);

		return mapper.list(start, end);
	}

}
