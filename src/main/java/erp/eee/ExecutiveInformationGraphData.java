package erp.eee;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import erp.Action;

@Service("informationgraphdata")
public class ExecutiveInformationGraphData implements Action{

	@Resource
	InformationMapper mapper;
	
	
	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest req) {
			
			
			int year = Integer.parseInt((String)req.getParameter("year"));
			ArrayList<InformationVO> list1 =  mapper.totlist1();
			ArrayList<InformationVO> list2 =  mapper.totlist2();
			ArrayList<InformationVO> list3 =  mapper.totlist3();
			
			ArrayList<InformationVO> tot1 =  mapper.totprice1();
			ArrayList<InformationVO> tot2=  mapper.totprice2();
			ArrayList<InformationVO> tot3 =  mapper.totprice3();
			
			ArrayList<InformationVO> monthtot = mapper.monthtot(year);
			
			String totdata = "[";
			
			for (InformationVO vv : monthtot) {
				totdata += "{\"monthtot\":" + vv.getMonthtot() + "},";
			}			
			for (InformationVO vv : tot1) {
				totdata += "{\"totprice1\":" + vv.getTotprice() + "},";
			}
			for (InformationVO vv : tot2) {
				totdata += "{\"totprice2\":" + vv.getTotprice() + "},";
			}
			for (InformationVO vv : tot3) {
				totdata += "{\"totprice3\":" + vv.getTotprice() + "},";
			}
			for (InformationVO oo : list1) {
				totdata +="{"
						+ "\"pdname1\":\"" + oo.getPdname() +  "\", "
						+ "\"cnt1\":" + oo.getCnt() +  "},";			
			}
			for (InformationVO oo : list2) {
				totdata +="{"
						+ "\"pdname2\":\"" + oo.getPdname() +  "\", "
						+ "\"cnt2\":" + oo.getCnt() +  "},";			
			}
			for (InformationVO oo : list3) {
				totdata +="{"
						+ "\"pdname3\":\"" + oo.getPdname() +  "\", "
						+ "\"cnt3\":" + oo.getCnt() + "},";				
			}
			
			totdata = totdata.substring(0, totdata.length()-1) + "]";
		
		return totdata;
	}

}
