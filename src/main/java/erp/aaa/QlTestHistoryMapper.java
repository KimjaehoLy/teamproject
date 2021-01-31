package erp.aaa;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import erp.SearchVO;

@Mapper
public interface QlTestHistoryMapper {

	
	/*품질 이력 영역*/
	List<QlTestHistoryVO> historylistSch(SearchVO vo);
	
	int totalCnt4(SearchVO vo);
	
	QlTestHistoryVO historydetail(String pdcode); //상세
	
	int historydelete(QlTestHistoryVO vo);  //삭제 
	int historydeletetwo(String vo);  //삭제 
	
	/*-----------------------*/
	
	

	

}
