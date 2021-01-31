package erp.ajax;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import erp.Action;
import erp.aaa.QlTestHistoryVO;
import erp.aaa.QlTestMapper;
import erp.aaa.QlTestVO;
import erp.jjj.CorrepondentVO;
import erp.sss.InvenMapper;
import erp.sss.InvenVO;


@Service("searchinvendata")
public class SearchInvenData implements Action{

	@Resource
	QlTestMapper mapper;
	
	@Override
	public Object execute(HashMap<String, Object> map, HttpServletRequest req) {
		
		String codename = "[";
		
		ArrayList<InvenVO> invenarr =  mapper.invenlist();
		
		// qltest테이블의 제품코드 받아오기 
		ArrayList<QlTestVO> pdcode1 =  mapper.pdcodelist();		
		// qltesthistory테이블의 제품코드 받아오기 
		ArrayList<QlTestHistoryVO> pdcode2 =  mapper.pdcodelist2();
		
		// Correpondent테이블의 거래처 받아오기 
		ArrayList<CorrepondentVO> customername =  mapper.customerlist();
		
		// qltest테이블의 검사코드 받아오기 
		ArrayList<QlTestVO> qlcode1 =  mapper. qlcodelist();			
		// qltesthistory테이블의 검사코드 받아오기 
		ArrayList<QlTestHistoryVO> qlcode2 =  mapper. qlcodelist2();
		
	
		for (InvenVO vv : invenarr) {
			codename +="{"
					+ "\"codeid\":\"" + vv.getCode() +  "\", "
					+ "\"qtt\":\"" + vv.getQtt() + "\", "
					+ "\"pdname\":\"" + vv.getName() + "\","
					+ "\"price\":\"" + vv.getCost() + "\"},";
		}
		for (QlTestVO vv : pdcode1) {
			codename += "{\"pdcode\":\"" + vv.getPdcode() +  "\"},";
		}
		for (QlTestHistoryVO vv : pdcode2) {
			codename += "{\"pdcode\":\"" + vv.getPdcode() +  "\"},";
		}
		for (QlTestVO vv : qlcode1) {
			codename += "{\"qlcode\":\"" + vv.getQlcode() +  "\"},";
		}
		for (QlTestHistoryVO vv : qlcode2) {
			codename += "{\"qlcode\":\"" + vv.getQlcode() +  "\"},";
		}
		for (CorrepondentVO vv : customername) {
			codename += "{\"customer\":\"" + vv.getCrre_name() +  "\"},";
		}
		
		codename = codename.substring(0, codename.length()-1) + "]";
	
		
		return codename;
	}

}
