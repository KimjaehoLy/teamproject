package erp.aaa;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.web.bind.annotation.RequestMapping;


@Alias("QlTestHistoryVO")
public class QlTestHistoryVO {
	String pdcode, qlcode, qlpdname, qlprice2, qlway, testername, qlstate,failreson, customer;
	Integer qlcnt,qlsamplecnt,qlsuccnt,qlfailcnt,qlprice;
	String regdate;
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
	
	
	
	public Integer getQlsuccnt() {
		return qlsuccnt;
	}
	public void setQlsuccnt(Integer qlsuccnt) {
		this.qlsuccnt = qlsuccnt;
	}
	public String getFailreson() {
		if(failreson == null)
			failreson = "";	
		return failreson;
	}
	public String getFailresonstr() {
		return getFailreson().replace("\n", "<br>");
	}

	public void setFailreson(String failreson) {	
		this.failreson = failreson;
	}

	public String getPdcode() {
		return pdcode;
	}

	public void setPdcode(String pdcode) {
		this.pdcode = pdcode;
	}

	public String getQlcode() {
		return qlcode;
	}

	public void setQlcode(String qlcode) {
		this.qlcode = qlcode;
	}

	public String getQlpdname() {
		return qlpdname;
	}

	public void setQlpdname(String qlpdname) {
		this.qlpdname = qlpdname;
	}

	public String getQlprice2() {
		return qlprice2;
	}
	public void setQlprice2(String qlprice2) {
		this.qlprice2 = qlprice2;
	}
	public Integer getQlprice() {
		return qlprice;
	}
	public void setQlprice(Integer qlprice) {
		this.qlprice = qlprice;
	}
	public String getQlway() {
		return qlway;
	}

	public void setQlway(String qlway) {
		this.qlway = qlway;
	}

	public String getTestername() {
		return testername;
	}

	public void setTestername(String testername) {
		this.testername = testername;
	}

	public String getQlstate() {
		return qlstate;
	}

	public void setQlstate(String qlstate) {
		this.qlstate = qlstate;
	}

	public String getCustomer() {
		return customer;
	}

	public void setCustomer(String customer) {
		this.customer = customer;
	}

	public Integer getQlcnt() {
		return qlcnt;
	}

	public void setQlcnt(Integer qlcnt) {
		this.qlcnt = qlcnt;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = sf.format(regdate);
	}

	public Integer getQlsamplecnt() {
		return qlsamplecnt;
	}

	public void setQlsamplecnt(Integer qlsamplecnt) {
		this.qlsamplecnt = qlsamplecnt;
	}

	public Integer getQlfailcnt() {
		return qlfailcnt;
	}

	public void setQlfailcnt(Integer qlfailcnt) {
		this.qlfailcnt = qlfailcnt;
	}

	@Override
	public String toString() {
		return "QlTestHistoryVO [pdcode=" + pdcode + ", qlcode=" + qlcode + ", qlpdname=" + qlpdname + ", qlprice="
				+ qlprice + ", qlway=" + qlway + ", testername=" + testername + ", qlstate=" + qlstate + ", failreson="
				+ failreson + ", customer=" + customer + ", qlcnt=" + qlcnt + ", qlsamplecnt=" + qlsamplecnt
				+ ", qlfailcnt=" + qlfailcnt + ", regdate=" + regdate + ", sf=" + sf + "]";
	}

	
	

	
}
