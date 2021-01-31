package erp.page;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import erp.hhh.UserVO;

@Mapper
public interface NoteMapper {

	List<NoteVO> list(Object a);
	
	List<NoteVO> listT(Object a);
	
	void insert(Object vo);

	void delete(Object vo);
	
	Integer totalCnt(Object vo);
	
	Integer totalCntT(Object vo);
	
	NoteVO detail(NoteVO vo);
	
	void chk(NoteVO vo);
}
