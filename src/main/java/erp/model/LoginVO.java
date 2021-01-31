package erp.model;

import org.apache.ibatis.type.Alias;

@Alias("loginVO")
public class LoginVO {

	String acce_id, acce_userpw, acce_auth;

	public String getAcce_id() {
		return acce_id;
	}

	public void setAcce_id(String acce_id) {
		this.acce_id = acce_id;
	}

	public String getAcce_userpw() {
		return acce_userpw;
	}

	public void setAcce_userpw(String acce_userpw) {
		this.acce_userpw = acce_userpw;
	}

	public String getAcce_auth() {
		return acce_auth;
	}

	public void setAcce_auth(String acce_auth) {
		this.acce_auth = acce_auth;
	}

	
	
	
}
