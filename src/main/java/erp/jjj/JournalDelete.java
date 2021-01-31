package erp.jjj;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import erp.Action;


@Service("journaldelete")
public class JournalDelete implements Action{

	@Resource
	JournalMapper mapper;
	
	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest req) {
		
		mapper.delete((JournalVO)map.get("jjouv"));
		
		return null;
	}

}
