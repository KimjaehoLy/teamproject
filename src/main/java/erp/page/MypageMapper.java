package erp.page;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MypageMapper {

	MypageVO page_detail(Object a);
	MypageVO page_modify(Object a);
	

}
