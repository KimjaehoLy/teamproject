package erp.aaa;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import erp.Action;


@Service("inputreg")
public class InputReg implements Action{

	@Resource
	QlTestMapper mapper;
	
	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest req) {
		QlTestVO vo = 	(QlTestVO)map.get("aaqv");
		
		QlTestVO vo2 = 	new QlTestVO();
		
		
		String[] pdcode = vo.getPdcode().split(",");
		String[] qlcode = vo.getQlcode().split(",");
		String[] qlpdname = vo.getQlpdname().split(",");
		String[] qlcnt =  vo.getQlcnt2().split(",");
		String[] qlsamplecnt =  vo.getQlsamplecnt2().split(",");
		String[] qlsuccnt =  vo.getQlsuccnt2().split(",");
		String[] qlfailcnt =  vo.getQlfailcnt2().split(",");
		String[] qlprice = vo.getQlprice2().split(",");
		String[] testername = vo.getTestername().split(",");
		String[] qlway = vo.getQlway().split(",");
		String[] customer = vo.getCustomer().split(",");
		String[] qlstate = vo.getQlstate().split(",");
		String[] failreson = vo.getFailreson().split(",");
			
		
		for (int i = 0; i < vo.getPdcode().split(",").length; i++) {
			vo2.pdcode = pdcode[i];
			vo2.qlcode = qlcode[i];
			vo2.qlpdname = qlpdname[i];
			if (qlcnt[i].equals("")) {
				vo2.qlcnt = 0;				
			}else {
				vo2.qlcnt = Integer.parseInt(qlcnt[i]);				
			}
			if (qlsamplecnt[i].equals(" ")) {
				vo2.qlsamplecnt = 0;				
			}else {
				vo2.qlsamplecnt = Integer.parseInt(qlsamplecnt[i]);				
			}
			if (qlsuccnt[i].equals(" ")) {
				vo2.qlsuccnt = 0;				
			}else {
				vo2.qlsuccnt = Integer.parseInt(qlsuccnt[i]);				
			}
			if (qlfailcnt[i].equals(" ")) {
				vo2.qlfailcnt = 0;				
			}else {
				vo2.qlfailcnt = Integer.parseInt(qlfailcnt[i]);				
			}
			if (qlprice[i].equals("")) {
				vo2.qlprice = 0;				
			}else {
				vo2.qlprice = Integer.parseInt(qlprice[i]);				
			}
			vo2.testername = testername[i];
			vo2.qlway = qlway[i];
			vo2.customer = customer[i];
			vo2.qlstate = qlstate[i];
		    vo2.failreson = failreson[i];				

			
			mapper.insert(vo2);
		}
		
	
		req.setAttribute("url", "../../search/list");
		return req;
	}
	
}
