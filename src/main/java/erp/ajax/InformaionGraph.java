package erp.ajax;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import erp.Action;
import erp.aaa.QlTestMapper;

@Service("informationgraph")
public class InformaionGraph implements Action{
	@Resource
	QlTestMapper mapper;
	
	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest req) {


		return null;
	}

}
