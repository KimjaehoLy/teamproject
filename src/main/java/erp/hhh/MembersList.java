package erp.hhh;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import erp.Action;
import erp.SearchVO;


@Service("memberslist")
public class MembersList implements Action{

	@Resource
	UserMapper mapper;
	
	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest request) {
		System.out.println("User/list execute() 실행");
		
		SearchVO pag = (SearchVO)map.get("servo");
		UserVO vo = (UserVO)map.get("user");
		pag.setSearch1(vo.getUser_cate());
		pag.setSearch2(vo.getUser_lev());
		pag.setSearch3(vo.getUser_name());
		
		int nowPage = 1;
		int pageLimit = 6;
		int pageNumLimit = 3;
		
		if(pag.getNowPage()!=null)
			nowPage = pag.getNowPage();

		int lastPage = (int)Math.ceil(mapper.user_listTotCnt(pag)/pageLimit)+1;
	
		int start = (nowPage-1)*pageLimit+1;
	
		int end = nowPage*pageLimit;
	
		
		int startPage = (nowPage-1)/pageNumLimit*pageNumLimit+1;
	
		int endPage = startPage+pageNumLimit-1;
	
		
		if(endPage>lastPage)
			endPage=lastPage;
		
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("lastPage", lastPage);
		
		
		
		pag.setSearchstart(start);
		pag.setSearchend(end);
		
		return mapper.user_list(pag);
	}

}
