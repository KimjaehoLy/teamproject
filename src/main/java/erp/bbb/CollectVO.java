package erp.bbb;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("collectVO")
public class CollectVO {
	String order_num5, customer, col_kind, evi, bal, leader, content, regdate;

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	public String getCol_kind() {
		return col_kind;
	}

	public void setCol_kind(String col_kind) {
		this.col_kind = col_kind;
	}

	public String getEvi() {
		return evi;
	}

	public void setEvi(String evi) {
		this.evi = evi;
	}

	public String getBal() {
		return bal;
	}

	public void setBal(String bal) {
		this.bal = bal;
	}

	public String getOrder_num5() {
		return order_num5;
	}

	public void setOrder_num5(String order_num5) {
		this.order_num5 = order_num5;
	}

	public String getCustomer() {
		return customer;
	}

	public void setCustomer(String customer) {
		this.customer = customer;
	}

	public String getLeader() {
		return leader;
	}

	public void setLeader(String leader) {
		this.leader = leader;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = sdf.format(regdate);

	}
}
