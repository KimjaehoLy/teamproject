package erp;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

public interface Action {
	Object execute(HashMap<String, Object> map, HttpServletRequest req);

}
