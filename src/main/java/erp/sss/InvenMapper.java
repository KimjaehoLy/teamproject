package erp.sss;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import erp.SearchVO;
import erp.aaa.QlTestHistoryVO;
import erp.aaa.QlTestVO;
import erp.bbb.ComissionVO;

@Mapper
public interface InvenMapper {

	List<InvenVO> list(int start, int end);
	
	List<Inven_outVO> outlist(SearchVO vo);
	
	int totalCnt(SearchVO vo);
	int outtotalCnt(SearchVO vo);
	
	//재고조회
	List<InvenVO> listSch(SearchVO vo);
	//출고조회
//	List<Inven_outVO> outlistSch(int start, int end);
	List<ComissionVO> outlistSch(SearchVO vo);
	
	int searchCnt(SearchVO vo);
	int outsearchCnt(SearchVO vo);
	
	InvenVO detail(String code);
	
	Inven_outVO outdetail(String code);
	
	List<InvenVO> outindetail(SearchVO vo);
	
	int outinCnt(SearchVO vo);
	
	//재고등록
	void insert(InvenVO vo);
	//출고등록
	void outinsert(Inven_outVO vo);
	
	//재고수정
	void modify(InvenVO vo);
	//출고수정
	void outmodify(Inven_outVO vo);
	
	
	//재고삭제
	int delete(InvenVO vo);
	//출고삭제
	int outdelete(Inven_outVO vo);
	
	//거래여부 갱신
	void qlinvenmodify(QlTestHistoryVO vo);
	void qlinvenfailmodify(QlTestHistoryVO vo);
	 
	//출고 처리 됐을 때 출고 수량만큼 재고수량.의뢰수량 빠짐
	void outchkmodify(Inven_outVO vo);
	void outqttmodify(Inven_outVO vo);
			
	/*인벤 확인할 정보 테스트 합격 불합격 정보*/
	List<QlTestHistoryVO> testinvenchk(String pass);

	ComissionVO invenimpomodify(String code);
	
	//ArrayList<InvenVO> codelist();
	
	//코드, 거래처 중복체크
	Integer codeChk(String code);
	Integer costChk(String cost);
	Integer clientChk(String client);
}
