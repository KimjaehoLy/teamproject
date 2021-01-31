package erp.bbb;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import erp.Action;

@Service("processingdetail")
public class ProcessingDetail implements Action {

	@Resource
	ProcessingMapper mapper;

	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest req) {

		ProcessingVO vo = (ProcessingVO) map.get("pvo");
		return mapper.detail(vo.o2);
	}

}
