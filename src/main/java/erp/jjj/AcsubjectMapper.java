package erp.jjj;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import erp.SearchVO;

@Mapper
public interface AcsubjectMapper {

	List<AcsubjectVO> list(int start, int end);
	
	AcsubjectVO detail(int no);
	
	int totalCnt();

	List<AcsubjectVO> search(SearchVO vo);
	
	int searchCnt(SearchVO vo);
	

}
