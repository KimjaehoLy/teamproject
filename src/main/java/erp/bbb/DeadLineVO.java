package erp.bbb;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("deadLineVO")
public class DeadLineVO {
	String order_num4, customer, tex, chit, bill_num, leader, content, end_kind, rnum, regdate;

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	public String getEnd_kind() {
		return end_kind;
	}

	public void setEnd_kind(String end_kind) {
		this.end_kind = end_kind;
	}

	public String getChit() {
		return chit;
	}

	public void setChit(String chit) {
		this.chit = chit;
	}

	public String getBill_num() {
		return bill_num;
	}

	public void setBill_num(String bill_num) {
		this.bill_num = bill_num;
	}

	public String getRnum() {
		return rnum;
	}

	public void setRnum(String rnum) {
		this.rnum = rnum;
	}

	public String getOrder_num4() {
		return order_num4;
	}

	public void setOrder_num4(String order_num4) {
		this.order_num4 = order_num4;
	}

	public String getCustomer() {
		return customer;
	}

	public void setCustomer(String customer) {
		this.customer = customer;
	}

	public String getTex() {
		return tex;
	}

	public void setTex(String tex) {
		this.tex = tex;
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
