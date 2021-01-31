package erp.eee;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface InformationMapper {

	
	ArrayList<InformationVO> totlist1();
	ArrayList<InformationVO> totlist2();
	ArrayList<InformationVO> totlist3();
	
	ArrayList<InformationVO> totprice1();
	ArrayList<InformationVO> totprice2();
	ArrayList<InformationVO> totprice3();
	
	ArrayList<InformationVO> monthtot(int year);
}
