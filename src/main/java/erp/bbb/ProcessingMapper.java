package erp.bbb;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import erp.SearchVO;


@Mapper
public interface ProcessingMapper {

	ProcessingVO detail(Object a);
	
	ProcessingVO detailf(Object a);

	List<ProcessingVO> list(int start, int end);
	
	List<ProcessingVO> listf(int start, int end);

	int totalCnt();

	int totalCntF();

	List<ProcessingVO> search(SearchVO vo);
	
	List<ProcessingVO> searchF(SearchVO vo);
	
	int searchCnt(SearchVO vo);
	
	int searchCntF(SearchVO vo);
}
