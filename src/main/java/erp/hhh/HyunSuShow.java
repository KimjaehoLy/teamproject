package erp.hhh;

import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public class HyunSuShow {
	
	public HyunSuShow() {
		
		
	}
	
	//데이터 출퇴근 수정할때 쓰는 달의 첫날 마지막날 리턴
	public String[] startEndDay(AttendanceVO att) {
		Date date = new Date();
		date.setDate(1);
		
		// 검색할 달을 1일
		String start = new SimpleDateFormat("yyyy-MM-dd").format(date);
//		System.out.println("HyunSuShow.java/start : " + start);
		
		// 검색할 달의 마지막날 추출
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		date.setDate(cal.getActualMaximum(Calendar.DAY_OF_MONTH) + 1);
		String end = new SimpleDateFormat("yyyy-MM-dd").format(date);
//		System.out.println("HyunSuShow.java/end : " + end);
		System.out.println("HyunSuShow.java/getToday()if문전 : " + att.getToday());
		if(!att.getToday().equals("무")) {
			System.out.println("HyunSuShow.java/getToday()if문후 : " + att.getToday());
			//att.getToday() 검색한 날짜 숫자로 짜름
			int[] dateSplit = Arrays.stream(att.getToday().split("-")).mapToInt(Integer::parseInt).toArray();
			//그달의 마지막날 추출
			date = new Date(dateSplit[0]-1900, dateSplit[1]-1, dateSplit[2]);
			// 검색할 달을 1일
			date.setDate(1);
			start = new SimpleDateFormat("yyyy-MM-dd").format(date);
			cal.setTime(date);
			// 검색할 달의 마지막날
			date.setDate(cal.getActualMaximum(Calendar.DAY_OF_MONTH) + 1);
			end = new SimpleDateFormat("yyyy-MM-dd").format(date);
		}
		
		String[] returnData = {start, end};
		System.out.println("HyunSuShow.java/start : " + start);
		System.out.println("HyunSuShow.java/end : " + end);
		return returnData;
		
	}
	
	
	//UserVO 필드 초기화
	void calc(UserVO userVO) {
		userVO.user_plusTime2 = 0;
		userVO.user_plusTime1 = 0;
		for (int i = 0; i < userVO.attendace.size(); i++) {
			AttendanceVO attVO = userVO.attendace.get(i);
																			
			
//			System.out.println("요일: " + attVO.today.getDate() + ", " + attVO.today.getDay() + ", " + 
//					new SimpleDateFormat("yyyy-MM-dd (E) HH:mm:ss").format(attVO.today) + ", "  +
//					new SimpleDateFormat("yyyy-MM-dd (E) HH:mm:ss").format(attVO.start_time) + ", "+
//					new SimpleDateFormat("yyyy-MM-dd (E) HH:mm:ss").format(attVO.end_time));
			if(attVO.today.getDay() == 0 || attVO.today.getDay() == 6) {  // 일요일이거나 토요일이면
				// 휴일 근무 시간에 추가
				userVO.user_plusTime2 += (attVO.end_time.getTime() - attVO.start_time.getTime()) / 60000 / 60 - 9; 
					// 60000: 분으로 변경, 60 : 시간으로 변경
			}
			else {
				userVO.user_plusTime1 += (attVO.end_time.getTime() - attVO.start_time.getTime()) / 60000 / 60 - 9; 
					// 60000: 분으로 변경, 60 : 시간으로 변경
			}
		}
		
		/*연장근무수당*/userVO.user_plusPay1 = userVO.user_plusTime1 * 8530;
		/*휴일근무수당*/userVO.user_plusPay2 = userVO.user_plusTime2 * 17060;
		/*연장수당 + 휴일근무수당*/userVO.user_totPlusPay = userVO.user_plusPay1 + userVO.user_plusPay2;
		/*원급 + 추가수당*/userVO.user_totPay = userVO.user_pay + userVO.user_totPlusPay; // 추가 수당까지 합친 한달 월급
		
		/*국민연금*/userVO.user_premium1 = Integer.parseInt(String.valueOf(Math.round(userVO.user_totPay * 0.0450))); // 국민연금 4.50%
		/*건강보험*/userVO.user_premium2 = Integer.parseInt(String.valueOf(Math.round(userVO.user_totPay * 0.0323))); // 건강보험 3.23%
		/*장기요양*/userVO.user_premium3 = Integer.parseInt(String.valueOf(Math.round(userVO.user_totPay * 0.0851))); // 장기요양 8.51%
		/*고용보험*/userVO.user_premium4 = Integer.parseInt(String.valueOf(Math.round(userVO.user_totPay * 0.0080))); // 고용보험
		/*소득세*/userVO.user_premium5 = Integer.parseInt(String.valueOf(Math.round(userVO.user_totPay * 0.00859))); // 소득세 0.00859%
		/*지방소득세*/userVO.user_premium6 = Integer.parseInt(String.valueOf(Math.round(userVO.user_premium5 * 0.1))); // 지방소득세 소득세의 0.1%
		/*보험료 tot*/userVO.user_totPremium = userVO.user_premium1 + userVO.user_premium2
							+ userVO.user_premium3 + userVO.user_premium4 + userVO.user_premium5;
		/*공제총액*/userVO.user_allTotPay = (int) (userVO.user_totPay - userVO.user_totPremium);
		/*공제총퍼센트*/userVO.user_totPremium2 = (int)(((double)userVO.user_totPremium) / ((double)userVO.user_allTotPay) * 100.0);
		
		
		
		
		
	}
	
	public int[] yearMonth() {
		Date dd = new Date();
		int[] res = {dd.getYear() + 1900, dd.getMonth() + 1}; 
		
		
		return res;
	}
	
	public HashMap<String, Object> nowSalery(UserVO vo) {
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("vo", vo);
		Date todayDate = new Date();
		String today = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(todayDate);
		paramMap.put("start", today);
		paramMap.put("end", today);
		paramMap.put("today", new SimpleDateFormat("yyyy-MM-dd").format(todayDate));
		
		paramMap.put("end_today", new SimpleDateFormat("yyyy-MM-dd").format(todayDate));
		todayDate.setDate(1);
		paramMap.put("start_today", new SimpleDateFormat("yyyy-MM-dd").format(todayDate));
		System.out.println(paramMap.get("start_today"));
		System.out.println(paramMap.get("end_today"));
		
		return paramMap;
		
		
	}
	
	// 암호화
	public String encrypt(String user_pw) { 
		String enPw = ""; // 암호화 시켜서 닮을 변수
		for(int i = 0; i < user_pw.length(); i++) { // 니가 입력한 문자 갯수만큼 반복
			enPw += "" + (char)(user_pw.charAt(i) << 1); 
				// getPw()가 문자열이기때문에 인덱스로 접근하려면 charAt()메소드를 사용해야함
				// String 타입은 원래 char가 모인 배열이기때문에 인덱스로 접근가능. char 타입으로 형변환
				// 하고 인덱스로 하나하나 접근함
				// 문자 하나하나 비트 이동 해서 암호화를 하고 다시 String 타입으로 바꿔서 변수에 할당함.
		}
		return enPw; // 암호화된 패스워드를 반환함.
	}
	
	
	// 복호화
	public String decrypt(String user_pw) { 
		String dePw = ""; // 복호화 시켜서 담을 변수
		for(int i = 0; i < user_pw.length(); i++) { // 니가 입력한 문자 갯수만큼 반복
			dePw += (char)(user_pw.charAt(i) >> 1);
			// getPw()가 문자열이기때문에 인덱스로 접근하려면 charAt()메소드를 사용해야함
			// String 타입은 원래 char가 모인 배열이기때문에 인덱스로 접근가능. char 타입으로 형변환
			// 하고 인덱스로 하나하나 접근함
			// 문자 하나하나 비트 이동 해서 복호화 하고 다시 String 타입으로 바꿔서 변수에 할당함
		}
		return dePw; // 복호화된 패스워드를 반환함.
		
	} 
	
	// 파일다운하기위한 메서드
		void fileUpload(MultipartFile ff, HttpServletRequest request) {
			System.out.println("파일업로드 실행");

			String path = request.getRealPath("/up"); // 배포한다고 하면 이거 써야댐
			path = "C:\\김재호\\Java공부자료\\워크스페이스\\sts_mvc_work\\erpTeam\\src\\main\\resources\\static\\userFile";

			try {

				FileOutputStream fos = new FileOutputStream(path + "/" + ff.getOriginalFilename());

				fos.write(ff.getBytes());

				fos.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	
	
	
	
	
	

}
