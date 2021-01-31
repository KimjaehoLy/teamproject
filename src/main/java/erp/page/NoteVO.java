package erp.page;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("noteVO")
public class NoteVO {
	String note_title, note_content, fromu, tou, regdate, note_detail, note_chkst;
	Integer note_chk, note_num;

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	public String getFromu() {
		return fromu;
	}

	public void setFromu(String fromu) {
		this.fromu = fromu;
	}

	public String getTou() {
		return tou;
	}

	public void setTou(String tou) {
		this.tou = tou;
	}

	public String getNote_title() {
		return note_title;
	}

	public void setNote_title(String note_title) {
		this.note_title = note_title;
	}

	public String getNote_content() {
		return note_content;
	}

	public void setNote_content(String note_content) {
		this.note_content = note_content;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = sdf.format(regdate);
	}

	public String getNote_detail() {
		return note_detail;
	}

	public void setNote_detail(String note_detail) {
		this.note_detail = note_detail;
	}

	public Integer getNote_chk() {
		return note_chk;
	}

	public void setNote_chk(Integer note_chk) {
		this.note_chk = note_chk;
	}

	public String getNote_chkst() {
		if(note_chk == null)
			note_chkst="안읽음";
		else 
			note_chkst="읽음";
		
		return note_chkst;
	}

	public void setNote_chkst(String note_chkst) {
		this.note_chkst = note_chkst;
	}

	public Integer getNote_num() {
		return note_num;
	}

	public void setNote_num(Integer note_num) {
		this.note_num = note_num;
	}
	
	
	
}
