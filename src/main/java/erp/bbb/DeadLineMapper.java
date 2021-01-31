package erp.bbb;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import erp.SearchVO;

@Mapper
public interface DeadLineMapper {
	
	void insert(Object vo);

	void update(Object vo);

	void delete(Object vo);
	
	List<DeadLineVO> list(int start, int end);

	int totalCnt();

	List<DeadLineVO> search(SearchVO vo);
	
	int searchCnt(SearchVO vo);

	String chk1(String a);
	
	String chk2(String a);
	
}
