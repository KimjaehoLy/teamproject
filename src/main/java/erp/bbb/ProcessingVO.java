package erp.bbb;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("processingVO")
public class ProcessingVO {
	String  customer, kind, cnt, chk, leader, content, regdate, cost, outdate, code, outch,
			foreign_num, o2,rd;

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");


	public String getForeign_num() {
		return foreign_num;
	}

	public void setForeign_num(String foreign_num) {
		this.foreign_num = foreign_num;
	}

	public String getOutch() {
		if (outch.equals("완료")) {
			this.outch = "정상";
		} else {
			this.outch = "예외";
		}
		return outch;
	}

	public void setOutch(String outch) {
		this.outch = outch;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getCost() {
		return cost;
	}

	public void setCost(String cost) {
		this.cost = cost;
	}

	public String getOutdate() {
		return outdate;
	}

	public void setOutdate(String outdate) {
		this.outdate = outdate;
	}
	
	public String getO2() {
		return o2;
	}

	public void setO2(String o2) {
		this.o2 = o2;
	}

	public String getRd() {
		return rd;
	}

	public void setRd(Date rd) {
		this.rd = sdf.format(rd);
	}

	public String getCustomer() {
		return customer;
	}

	public void setCustomer(String customer) {
		this.customer = customer;
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
