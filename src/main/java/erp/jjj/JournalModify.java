package erp.jjj;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import erp.Action;

@Service("journalmodify")
public class JournalModify implements Action{

	
	@Resource
	JournalMapper mapper;

	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest req) {

		mapper.modify((JournalVO)map.get("jjouv"));
		
		return null;
	}

}
