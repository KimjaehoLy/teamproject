package erp.bbb;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("sujuVO")
public class SujuVO {
	String order_num1, customer, tex, cost_s, leader, content, regdate;

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	public String getOrder_num1() {
		return order_num1;
	}

	public void setOrder_num1(String order_num1) {
		this.order_num1 = order_num1;
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

	public String getCost_s() {
		return cost_s;
	}

	public void setCost_s(String cost_s) {
		this.cost_s = cost_s;
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
