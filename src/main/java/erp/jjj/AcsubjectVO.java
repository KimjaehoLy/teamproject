package erp.jjj;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("AcsubjectVO")
public class AcsubjectVO {
	String accsu_code, accsu_subj, accsu_de, accsu_cre, accsu_detail, accsu_element;

	public String getAccsu_code() {
		return accsu_code;
	}

	public void setAccsu_code(String accsu_code) {
		this.accsu_code = accsu_code;
	}

	public String getAccsu_subj() {
		return accsu_subj;
	}

	public void setAccsu_subj(String accsu_subj) {
		this.accsu_subj = accsu_subj;
	}

	public String getAccsu_de() {
		return accsu_de;
	}

	public void setAccsu_de(String accsu_de) {
		this.accsu_de = accsu_de;
	}

	public String getAccsu_cre() {
		return accsu_cre;
	}

	public void setAccsu_cre(String accsu_cre) {
		this.accsu_cre = accsu_cre;
	}

	public String getAccsu_detail() {
		return accsu_detail;
	}

	public void setAccsu_detail(String accsu_detail) {
		this.accsu_detail = accsu_detail;
	}

	public String getAccsu_element() {
		return accsu_element;
	}

	public void setAccsu_element(String accsu_element) {
		this.accsu_element = accsu_element;
	}

	@Override
	public String toString() {
		return "AccsubjectVO [accsu_code=" + accsu_code + ", accsu_subj=" + accsu_subj + ", accsu_de=" + accsu_de
				+ ", accsu_cre=" + accsu_cre + ", accsu_detail=" + accsu_detail + ", accsu_element=" + accsu_element
				+ "]";
	}

	
	
}
