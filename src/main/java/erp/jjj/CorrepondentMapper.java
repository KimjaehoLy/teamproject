package erp.jjj;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import erp.SearchVO;
import erp.bbb.SujuVO;

@Mapper
public interface CorrepondentMapper {

	List<CorrepondentVO> list(int start, int end);
	
	CorrepondentVO detail(int no);
	
	int totalCnt();

	List<CorrepondentVO> search(SearchVO vo);
	
	int searchCnt(SearchVO vo);
	
	void insert(CorrepondentVO vo);
	
	void modify(CorrepondentVO vo);
	
	int delete(CorrepondentVO vo);
	
	int sulist(String cos);
	
	int corrchk(String name,String code, String num);
}
