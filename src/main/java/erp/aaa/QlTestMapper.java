package erp.aaa;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import erp.SearchVO;
import erp.jjj.CorrepondentVO;
import erp.sss.InvenVO;

@Mapper
public interface QlTestMapper {

	/*등록*/
	void insert(QlTestVO vo);
	/*-----------------------*/
		
	void searchhisinsert(QlTestVO vo); //검사현황 합격 or 불합격 -> 승인시 검사이력에 저장 
	/*검사현황*/
	List<QlTestVO> listSch(SearchVO vo); //검색 
	
	void searchmodify(QlTestVO pdcode); //수정
	
	
	
	QlTestVO detail(String pdcode);  //상세
	
	ArrayList<InvenVO> invenlist();
	//제품코드 리스트 받기 
	ArrayList<QlTestVO> pdcodelist();
	ArrayList<QlTestHistoryVO> pdcodelist2();
	
	//검사코드 리스트 받기 
	ArrayList<QlTestVO> qlcodelist();
	ArrayList<QlTestHistoryVO> qlcodelist2();
	
	//제품명 리스트 받기
	ArrayList<InvenVO> pdnamelist();
	
	//거래처 리스트 받기 
	ArrayList<CorrepondentVO> customerlist();
	
	int delete(QlTestVO vo);		//삭제
	int deletetwo(String vo);		//삭제
	
	/*-----------------------*/	

	int totalCnt3(SearchVO vo);


	
	

	

}
