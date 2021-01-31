package erp.jjj;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import erp.SearchVO;

@Mapper
public interface JournalMapper {

	List<JournalVO> list(int start, int end);
	
	JournalVO detail(int no);
	
	int totalCnt();

	List<JournalVO> search(SearchVO vo);
	
	int searchCnt(SearchVO vo);
	
	void insert(JournalVO vo);
	
	void modify(JournalVO vo);
	
	int delete(JournalVO vo);
}
