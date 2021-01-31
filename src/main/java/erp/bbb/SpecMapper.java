package erp.bbb;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import erp.SearchVO;

@Mapper
public interface SpecMapper {

	SpecVO detail(Object a);
	
	List<SpecVO> list(int start, int end);

	int totalCnt();

	List<SpecVO> search(SearchVO vo);
	
	int searchCnt(SearchVO vo);
	
}
