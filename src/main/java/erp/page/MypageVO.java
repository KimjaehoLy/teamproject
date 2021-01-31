package erp.page;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("mypageVO")
public class MypageVO {
	String user_name, // 사원이름
			user_id, // 사원아이디
			user_pw, // 사원 비밀번호
			user_tel, // 사원 전화번호
			user_add, // 사원 주소
			user_email, // 사원 이메일
			user_cate, // 사원 부서
			user_lev, // 사원 직급
			user_file, // 사원 사진파일
			user_gender, // 사원 성별
			user_date; // 사원 입사일

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public String getUser_tel() {
		return user_tel;
	}

	public void setUser_tel(String user_tel) {
		this.user_tel = user_tel;
	}

	public String getUser_add() {
		return user_add;
	}

	public void setUser_add(String user_add) {
		this.user_add = user_add;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_cate() {
		return user_cate;
	}

	public void setUser_cate(String user_cate) {
		this.user_cate = user_cate;
	}

	public String getUser_lev() {
		return user_lev;
	}

	public void setUser_lev(String user_lev) {
		this.user_lev = user_lev;
	}

	public String getUser_file() {
		return user_file;
	}

	public void setUser_file(String user_file) {
		this.user_file = user_file;
	}

	public String getUser_gender() {
		return user_gender;
	}

	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}

	public String getUser_date() {
		return user_date;
	}

	public void setUser_date(Date user_date) {
		this.user_date = sdf.format(user_date);
	}

}
