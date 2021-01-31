package erp;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EventcalenderMapper {

	List<EventcalenderVO> list();
	
	void addEvent(EventcalenderVO vo);
	
	void deleteEvent(EventcalenderVO vo);
}
