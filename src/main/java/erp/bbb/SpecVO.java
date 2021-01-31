package erp.bbb;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("specVO")
public class SpecVO {
	String o4, customer, tex, leader, regdate, sp_num, end_kind, bill_num, cnt, kind, bal, evi, col_kind, ss, oo;

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	
	
	public String getOo() {
		return oo;
	}

	public void setOo(String oo) {
		this.oo = oo;
	}

	public String getCnt() {
		return cnt;
	}

	public void setCnt(String cnt) {
		this.cnt = cnt;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getEnd_kind() {
		return end_kind;
	}

	public void setEnd_kind(String end_kind) {
		this.end_kind = end_kind;
	}

	public String getBill_num() {
		return bill_num;
	}

	public void setBill_num(String bill_num) {
		this.bill_num = bill_num;
	}

	public String getBal() {
		return bal;
	}

	public void setBal(String bal) {
		this.bal = bal;
	}

	public String getEvi() {
		return evi;
	}

	public void setEvi(String evi) {
		this.evi = evi;
	}

	public String getCol_kind() {
		return col_kind;
	}

	public void setCol_kind(String col_kind) {
		this.col_kind = col_kind;
	}

	public String getSs() {
		return ss;
	}

	public void setSs(String ss) {
		this.ss = ss;
	}

	public String getSp_num() {
		return sp_num;
	}

	public void setSp_num(String sp_num) {
		this.sp_num = sp_num;
	}

	public String getO4() {
		return o4;
	}

	public void setO4(String o4) {
			this.sp_num = o4.substring(0, 4) + "SP" + o4.substring(6, 10);
		this.o4 = o4;
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

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = sdf.format(regdate);

	}
}
