package erp.bbb;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("comissionVO")
public class ComissionVO {
	String order_num2, customer, kind, cnt, chk, leader, content, regdate, sch_1;

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	public String getSch_1() {
		return sch_1;
	}

	public void setSch_1(String sch_1) {
		this.sch_1 = sch_1;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getCnt() {
		return cnt;
	}

	public void setCnt(String cnt) {
		this.cnt = cnt;
	}

	public String getChk() {
		return chk;
	}

	public void setChk(String chk) {
		this.chk = chk;
	}

	public String getOrder_num2() {
		return order_num2;
	}

	public void setOrder_num2(String order_num2) {
		this.order_num2 = order_num2;
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
