package erp.eee;

import org.apache.ibatis.type.Alias;

@Alias("informationVO")
public class InformationVO {

	String pdname;
	Integer totprice,cnt,monthtot;
	
	
	public Integer getMonthtot() {
		return monthtot;
	}
	public void setMonthtot(Integer monthtot) {
		this.monthtot = monthtot;
	}
	public String getPdname() {
		return pdname;
	}
	public void setPdname(String pdname) {
		this.pdname = pdname;
	}
	public Integer getTotprice() {
		return totprice;
	}
	public void setTotprice(Integer totprice) {
		this.totprice = totprice;
	}
	public Integer getCnt() {
		return cnt;
	}
	public void setCnt(Integer cnt) {
		this.cnt = cnt;
	}
	@Override
	public String toString() {
		return "InformationVO [pdname=" + pdname + ", totprice=" + totprice + ", cnt=" + cnt + ", monthtot=" + monthtot
				+ "]";
	}
	
	
	
	
}
