package erp.jjj;

import org.apache.ibatis.type.Alias;

@Alias("CorrepondentVO")
public class CorrepondentVO {

	String crre_name, crre_number, crre_detail, crre_code;

	
	public String getCrre_code() {
		return crre_code;
	}

	public void setCrre_code(String crre_code) {
		this.crre_code = crre_code;
	}

	public String getCrre_name() {
		return crre_name;
	}

	public void setCrre_name(String crre_name) {
		this.crre_name = crre_name;
	}

	public String getCrre_number() {
		return crre_number;
	}

	public void setCrre_number(String crre_number) {
		this.crre_number = crre_number;
	}

	public String getCrre_detail() {
		return crre_detail;
	}

	public void setCrre_detail(String crre_detail) {
		this.crre_detail = crre_detail;
	}

	@Override
	public String toString() {
		return "CorrepondentVO [crre_name=" + crre_name + ", crre_number=" + crre_number + ", crre_detail="
				+ crre_detail + ", crre_code=" + crre_code + "]";
	}


	
	
}
