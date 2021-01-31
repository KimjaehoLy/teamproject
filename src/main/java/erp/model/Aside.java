package erp.model;

import java.util.ArrayList;

import erp.hhh.AttendanceVO;
import erp.hhh.HyunSuShow;

public class Aside {
	ArrayList<String[]> arr = new ArrayList<String[]>();
	
	public ArrayList<String[]>  aside(String cate){
		
		switch (cate) {
		case "aview":
			arr.add(new String[] {"검사등록","../../input/list"});
			arr.add(new String[] {"검사현황조회","../../search/list"});
			arr.add(new String[] {"검사이력관리","../../history/list"});
			arr.add(new String[] {"출근현황","../../status/list"});
			return arr;
		case "bview":
			arr.add(new String[] {"수주등록","../../suju/list"});
			arr.add(new String[] {"출고의뢰등록","../../comission/list"});
			arr.add(new String[] {"출고처리","../../processing/list"});
			arr.add(new String[] {"명세서 발행","../../spec/list"});
			arr.add(new String[] {"매출마감","../../deadline/list"});
			arr.add(new String[] {"수금등록","../../collect/list"});
			arr.add(new String[] {"출근현황","../../status/list"});
			return arr;
		case "hview":
			int[] yearMoth = new HyunSuShow().yearMonth(); 
			arr.add(new String[] {"회원관리","../../members/list"});
			arr.add(new String[] {"급여관리","../../salary/list?user_cate=&user_lev=&user_name=&searchDay=" + yearMoth[0] + "&searchDay=" + yearMoth[1] + "&searchDay=1"});
			arr.add(new String[] {"세금관리","../../tax/list?user_cate=&user_lev=&user_name=&searchDay=" + yearMoth[0] + "&searchDay=" + yearMoth[1] + "&searchDay=1"});
			arr.add(new String[] {"근태관리","../../attendance/list?user_cate=&user_lev=&user_name=&searchDay=" + yearMoth[0] + "&searchDay=" + yearMoth[1] + "&searchDay=1"});	
			arr.add(new String[] {"출근현황","../../status/list"});
			
			return arr;
		case "jview":
			arr.add(new String[] {"분개장 등록","../../journal/list"});
			arr.add(new String[] {"계정과목","../../acsubject/list"});
			arr.add(new String[] {"거래처 등록","../../correpondent/list"});
			arr.add(new String[] {"출근현황","../../status/list"});
			return arr;
		case "sview":
			arr.add(new String[] {"재고현황","../../invensta/list"});
            arr.add(new String[] {"재고조회","../../invenlookup/list"});
            arr.add(new String[] {"재고등록","../../invenenr/list"});
            arr.add(new String[] {"출고이력","../../inout/list"});
            arr.add(new String[] {"출고의뢰조회","../../inoutsch/list"});
            arr.add(new String[] {"출근현황","../../status/list"});
            return arr;
      
		}				
		return arr;
	}
}
