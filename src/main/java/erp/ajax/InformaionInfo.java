package erp.ajax;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import erp.Action;

@Service("informationinfo")
public class InformaionInfo implements Action{

	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest req) {
		
		return null;
	}

}
