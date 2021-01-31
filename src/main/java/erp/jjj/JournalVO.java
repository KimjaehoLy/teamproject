package erp.jjj;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("JournalVO")
public class JournalVO {
	Integer jou_no, deprice, creprice;
	String desubj, cresubj, sucode, account;
	Date regdate;

	public Integer getJou_no() {
		return jou_no;
	}
	public void setJou_no(Integer jou_no) {
		this.jou_no = jou_no;
	}
	public Integer getDeprice() {
		return deprice;
	}
	public void setDeprice(Integer deprice) {
		this.deprice = deprice;
	}
	public Integer getCreprice() {
		return creprice;
	}
	public void setCreprice(Integer creprice) {
		this.creprice = creprice;
	}
	public String getDesubj() {
		return desubj;
	}
	public void setDesubj(String desubj) {
		this.desubj = desubj;
	}
	public String getCresubj() {
		return cresubj;
	}
	public void setCresubj(String cresubj) {
		this.cresubj = cresubj;
	}
	public String getSucode() {
		return sucode;
	}
	public void setSucode(String sucode) {
		this.sucode = sucode;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "JournalVO [jou_no=" + jou_no + ", deprice=" + deprice + ", creprice=" + creprice + ", desubj=" + desubj
				+ ", cresubj=" + cresubj + ", sucode=" + sucode + ", account=" + account + ", regdate=" + regdate + "]";
	}

	
	
}
