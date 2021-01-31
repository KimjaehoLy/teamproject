package erp.hhh;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AttendanceMapper {

	// 사원 출석부 리스트
	List<AttendanceVO> att_list(String start, String end);
	
//	List<AttendanceVO> att_listSrh(String start, String end);
	
	
	// 사원 디데일 출석부
	List<AttendanceVO> att_detail(HashMap<String, Object> paramMap);
	
	//출근할때 월급 추가할려고
	List<AttendanceVO> att_detailPay(HashMap<String, Object> paramMap);
	
	// 사원 출퇴근 수정
	Integer att_modify(AttendanceVO attVO);
	
	
	List<Integer> att_statusList(String today);
	
	//사원 삭제하면 사원기록도 삭제
	Integer att_delete(UserVO vo);
	
	//월급수정
	Integer att_salModify(HashMap<String, Object> paramMap);
	
	//출근
	Integer att_startTime(HashMap<String, Object> paramMap);
	
	//퇴근
	Integer att_endTime(HashMap<String, Object> paramMap);
	
	
	// 출퇴근 버튼 데이타
	AttendanceVO att_status(Integer user_num, String today);
	
	
	
}
