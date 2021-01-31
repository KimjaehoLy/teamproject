package erp.hhh;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import erp.SearchVO;

@Mapper
public interface UserMapper {

	//리스트
	List<UserVO> user_allList(UserVO vo);
	
	//검색 리스트
	List<UserVO> user_list(SearchVO vo);
	
	//row 갯수
	Integer user_listTotCnt(SearchVO vo);
	
	//상세보기
	UserVO user_detail(String user_id);
	
	//유저 추가
	Integer user_insert(UserVO vo);
	
	//유저 정보 수정
	Integer user_modify(UserVO vo);
	
	//유저 정보 삭제
	Integer user_delete(UserVO vo);
	
	// 급여 수정
	Integer user_salModify(UserVO vo);
	
	// 로그인
	UserVO logindata(String acce_id); 
	
	// 사원추가 아이디 중복확인
	Integer joinIdChk(UserVO vo);
	
	// 사원추가 아이디 중복확인
	UserVO IdChk(UserVO vo);
	
	
	
}
