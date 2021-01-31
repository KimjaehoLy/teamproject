package erp.aaa;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.type.Alias;


@Alias("QlTestVO")
public class QlTestVO {
	String pdcode, qlcode, qlpdname, qlprice2, qlway,qlcnt2,qlsamplecnt2,qlsuccnt2,qlfailcnt2, testername,failreson, qlstate, customer;
	Integer qlcnt, qlsamplecnt,qlsuccnt, qlfailcnt,qlprice;
	String regdate;
	Integer totprice;
	String pdcode1, pdcode2;

	
	
	
	public Integer getTotprice() {
		return totprice;
	}

	public void setTotprice(Integer totprice) {
		this.totprice = totprice;
	}

	public String getPdcode1() {
		return pdcode1;
	}

	public void setPdcode1(String pdcode1) {
		this.pdcode1 = pdcode1;
	}

	public String getPdcode2() {
		return pdcode2;
	}

	public void setPdcode2(String pdcode2) {
		this.pdcode2 = pdcode2;
	}

	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");

	public String getQlsamplecnt2() {
		return qlsamplecnt2;
	}

	public void setQlsamplecnt2(String qlsamplecnt2) {
		this.qlsamplecnt2 = qlsamplecnt2;
	}

	public String getQlsuccnt2() {
		return qlsuccnt2;
	}

	public void setQlsuccnt2(String qlsuccnt2) {
		this.qlsuccnt2 = qlsuccnt2;
	}

	public String getQlfailcnt2() {
		return qlfailcnt2;
	}

	public void setQlfailcnt2(String qlfailcnt2) {
		this.qlfailcnt2 = qlfailcnt2;
	}

	public String getQlcnt2() {
		return qlcnt2;
	}

	public void setQlcnt2(String qlcnt2) {
		this.qlcnt2 = qlcnt2;
	}

	public Integer getQlsuccnt() {
		return qlsuccnt;
	}

	public void setQlsuccnt(Integer qlsuccnt) {
		this.qlsuccnt = qlsuccnt;
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

	@Override
	public String toString() {
		return "QlTestVO [pdcode=" + pdcode + ", qlcode=" + qlcode + ", qlpdname=" + qlpdname + ", qlprice2=" + qlprice2
				+ ", qlway=" + qlway + ", qlcnt2=" + qlcnt2 + ", qlsamplecnt2=" + qlsamplecnt2 + ", qlsuccnt2="
				+ qlsuccnt2 + ", qlfailcnt2=" + qlfailcnt2 + ", testername=" + testername + ", failreson=" + failreson
				+ ", qlstate=" + qlstate + ", customer=" + customer + ", qlcnt=" + qlcnt + ", qlsamplecnt="
				+ qlsamplecnt + ", qlsuccnt=" + qlsuccnt + ", qlfailcnt=" + qlfailcnt + ", qlprice=" + qlprice
				+ ", regdate=" + regdate + ", totprice=" + totprice + ", pdcode1=" + pdcode1 + ", pdcode2=" + pdcode2
				+ ", sf=" + sf + "]";
	}

	

	
	
	
}
