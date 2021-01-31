package erp.sss;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import erp.Action;
import erp.aaa.QlTestHistoryVO;
import erp.aaa.QlTestMapper;
import erp.aaa.QlTestVO;


@Service("invenstarefresh")
public class InvenstaRefresh implements Action{

	@Resource
	InvenMapper mapper;
	
	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest req) {
		
		/* for (QlTestVO qlvo : qlmapper.testinvenchk("합격")) {
			mapper.qlinvenmodify(qlvo);
		}
		for (QlTestVO qlvo : qlmapper.testinvenchk("불합격")) {
			mapper.qlinvenfailmodify(qlvo);
		} */
		
		for (QlTestHistoryVO qlvo : mapper.testinvenchk("합격")) {
			mapper.qlinvenmodify(qlvo);	
		}
		for (QlTestHistoryVO qlvo : mapper.testinvenchk("불합격")) {
			mapper.qlinvenfailmodify(qlvo);
		}
		return null;
	}

}
