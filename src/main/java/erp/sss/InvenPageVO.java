package erp.sss;

import org.apache.ibatis.type.Alias;

@Alias("InvenPageVO")
public class InvenPageVO {
	Integer nowPage;

	public Integer getNowPage() {
		return nowPage;
	}

	public void setNowPage(Integer nowPage) {
		this.nowPage = nowPage;
	}
}
