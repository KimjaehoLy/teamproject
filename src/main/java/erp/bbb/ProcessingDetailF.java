package erp.bbb;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import erp.Action;

@Service("processingdetailF")
public class ProcessingDetailF implements Action {

	@Resource
	ProcessingMapper mapper;

	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest req) {

		ProcessingVO vo = (ProcessingVO) map.get("pvo");
		return mapper.detailf(vo.o2);
	}

}
