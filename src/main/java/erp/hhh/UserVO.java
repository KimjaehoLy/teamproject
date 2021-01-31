package erp.hhh;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

@Alias("userVO")
public class UserVO {
	
	String user_num16;
	Integer user_num; // 사원번호
	String user_name; // 사원이름
	String user_id; // 사원아이디
	String user_pw; // 사원 비밀번호
	String user_tel; // 사원 전화번호
	String user_add; // 사원 주소
	String user_email; // 사원 이메일
	String user_cate; // 사원 부서
	String user_lev; // 사원 직급
	String user_file; // 사원 사진파일
	String user_gender; // 사원 성별
	String user_rrn; // 사원 주민번호
	Date user_date; // 사원 입사일
	Integer user_pay; // 사원 월급
	String user_career; // 사원 경력사항
	
	
	MultipartFile user_upfile;
	
	
	//사원 번호 16진수 출력하려고만듬
	public String getUser_num16() {
		if(user_num != null)
			return Integer.toHexString(user_num).toUpperCase();
		return null;
	}
	
	
	public MultipartFile getUser_upfile() {
		return user_upfile;
	}
	public void setUser_upfile(MultipartFile user_upfile) {
		this.user_upfile = user_upfile;
		this.user_file = user_upfile.getOriginalFilename();
	}
	
	public Integer getUser_num() {
		return user_num;
	}
	public void setUser_num(Integer user_num) {
		this.user_num = user_num;
	}
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
	public String getUser_rrn() {
		return user_rrn;
	}
	public void setUser_rrn(String user_rrn) {
		this.user_rrn = user_rrn;
	}
	public String getUser_date() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(user_date);
	}
	public void setUser_date(Date user_date) {
		this.user_date = user_date;
	}
	public Integer getUser_pay() {
		return user_pay;
	}
	public void setUser_pay(Integer user_pay) {
		this.user_pay = user_pay;
	}
	public String getUser_career() {
		return user_career;
	}
	public void setUser_career(String user_career) {
		this.user_career = user_career;
	}
	
	// 회원가입 하거나 수정할때 배열로 받으려고 만듬
	String[] user_rrn2;
	
	String[] user_tel2;
	
	String[] user_email2;

	public void setUser_rrn2(String[] user_rrn2) {
		this.user_rrn2 = user_rrn2;
		user_rrn = user_rrn2[0] + "-" + user_rrn2[1];
	}

	public void setUser_tel2(String[] user_tel2) {
		this.user_tel2 = user_tel2;
		user_tel = user_tel2[0] + "-" + user_tel2[1] + "-" + user_tel2[2];
	}

	public void setUser_email2(String[] user_email2) {
		this.user_email2 = user_email2;
		user_email = user_email2[0] + "@" + user_email2[1];
	}


	public String[] getUser_rrn2() {
		user_rrn2 = new String[2];
		user_rrn2[0] = user_rrn.substring(0, user_rrn.indexOf("-"));
		user_rrn2[1] = user_rrn.substring(user_rrn.indexOf("-")+1);		
		return user_rrn2;
	}


	public String[] getUser_tel2() {
		user_tel2 = new String[3];
		user_tel2[0] = user_tel.substring(0, user_tel.indexOf("-"));
		user_tel2[1] = user_tel.substring(user_tel.indexOf("-")+1, user_tel.lastIndexOf("-"));
		user_tel2[2] = user_tel.substring(user_tel.lastIndexOf("-")+1);
		return user_tel2;
	}


	public String[] getUser_email2() {
		user_email2 = new String[2];
		user_email2[0] = user_email.substring(0, user_email.indexOf("@"));
		user_email2[1] = user_email.substring(user_email.indexOf("@")+1);;
		return user_email2;
	}
	
	
	//-----------------------출퇴근 기록부-------------------------------
	
	ArrayList<AttendanceVO> attendace; // 출석정보 받아옴
	String user_percent1; // ex:출석일 10/31
	Integer user_percent2; // ex:출석률 30%


	public ArrayList<AttendanceVO> getAttendace() {
		return attendace;
	}


	public void setAttendace(ArrayList<AttendanceVO> attendace) {
		this.attendace = attendace;
		if(attendace.size() > 1) {
			Date dd = attendace.get(1).today;
			Calendar cal = Calendar.getInstance();
			cal.setTime(dd);
			
			// ex:출석일 10/31
			user_percent1 = attendace.size() + "/" + cal.getActualMaximum(Calendar.DAY_OF_MONTH);
			// ex:출석률 30%
			user_percent2 = (int)(((double)attendace.size()) / ((double)cal.getActualMaximum(Calendar.DAY_OF_MONTH)) * 100.0);
			
			new HyunSuShow().calc(this);
		}
		
	}


	public String getUser_percent1() {
		return user_percent1;
	}


	public void setUser_percent1(String user_percent1) {
		this.user_percent1 = user_percent1;
	}


	public Integer getUser_percent2() {
		return user_percent2;
	}


	public void setUser_percent2(Integer user_percent2) {
		this.user_percent2 = user_percent2;
	}
	
	//-------------------------급여관리--------------------
		long user_plusTime1; // 연장수당
		long user_plusTime2; // 연장수당
		long user_totPlusTime; // 연장수당
		long user_plusPay1; // 연장근무 시간
		long user_plusPay2; // 휴일근무 시간
		long user_totPlusPay;
		Integer user_plusPay3; // 포괄 보장수당
		long user_totPay; // 추가 수당까지 합친 한달 월급
		
		Integer user_premium1; // 국민연금 4.50%
		Integer user_premium2; // 건강보험 3.23%
		Integer user_premium3; // 장기요양 8.51%
		Integer user_premium4; // 고용보험 0.80%
		Integer user_premium5; // 소득세 0.5
		Integer user_premium6; // 지방소득세 소득세에 10%
		Integer user_totPremium; // 공제 총액
		Integer user_totPremium2; // 공제 퍼센트
		
		Integer user_allTotPay; //차감지급액
		


		public long getUser_plusPay1() {
			return user_plusPay1;
		}


		public void setUser_plusPay1(long user_plusPay1) {
			this.user_plusPay1 = user_plusPay1;
		}


		public long getUser_plusPay2() {
			return user_plusPay2;
		}


		public void setUser_plusPay2(long user_plusPay2) {
			this.user_plusPay2 = user_plusPay2;
		}


		public Integer getUser_plusPay3() {
			return user_plusPay3;
		}


		public void setUser_plusPay3(Integer user_plusPay3) {
			this.user_plusPay3 = user_plusPay3;
		}


		public Integer getUser_premium1() {
			return user_premium1;
		}


		public void setUser_premium1(Integer user_premium1) {
			this.user_premium1 = user_premium1;
		}


		public Integer getUser_premium2() {
			return user_premium2;
		}


		public void setUser_premium2(Integer user_premium2) {
			this.user_premium2 = user_premium2;
		}


		public Integer getUser_premium3() {
			return user_premium3;
		}


		public void setUser_premium3(Integer user_premium3) {
			this.user_premium3 = user_premium3;
		}


		public Integer getUser_premium4() {
			return user_premium4;
		}


		public void setUser_premium4(Integer user_premium4) {
			this.user_premium4 = user_premium4;
		}


		public long getUser_totPay() {
			return user_totPay;
		}


		public void setUser_totPay(long user_totPay) {
			this.user_totPay = user_totPay;
		}


		public Integer getUser_totPremium() {
			return user_totPremium;
		}


		public void setUser_totPremium(Integer user_totPremium) {
			this.user_totPremium = user_totPremium;
		}
		
		
		
		
		public long getUser_plusTime1() {
			return user_plusTime1;
		}


		public void setUser_plusTime1(long user_plusTime1) {
			this.user_plusTime1 = user_plusTime1;
		}


		public long getUser_plusTime2() {
			return user_plusTime2;
		}


		public void setUser_plusTime2(long user_plusTime2) {
			this.user_plusTime2 = user_plusTime2;
		}


		public long getUser_totPlusTime() {
			return user_totPlusTime;
		}


		public void setUser_totPlusTime(long user_totPlusTime) {
			this.user_totPlusTime = user_totPlusTime;
		}


		public long getUser_totPlusPay() {
			return user_totPlusPay;
		}


		public void setUser_totPlusPay(long user_totPlusPay) {
			this.user_totPlusPay = user_totPlusPay;
		}
		
		


		public Integer getUser_premium5() {
			return user_premium5;
		}


		public void setUser_premium5(Integer user_premium5) {
			this.user_premium5 = user_premium5;
		}


		public Integer getUser_premium6() {
			return user_premium6;
		}


		public void setUser_premium6(Integer user_premium6) {
			this.user_premium6 = user_premium6;
		}
		
		


		public Integer getUser_allTotPay() {
			return user_allTotPay;
		}


		public void setUser_allTotPay(Integer user_allTotPay) {
			this.user_allTotPay = user_allTotPay;
		}
		
		


		public Integer getUser_totPremium2() {
			return user_totPremium2;
		}


		public void setUser_totPremium2(Integer user_totPremium2) {
			this.user_totPremium2 = user_totPremium2;
		}


		@Override
		public String toString() {
			return "UserVO [user_num=" + user_num + ", user_name=" + user_name + ", user_id=" + user_id + ", user_pay="
					+ user_pay + "]";
		}
		
		public String toIdChk() {
			return "{\"user_id\":\"" + user_id +  "\"}";
		}


		
		
}
