package erp.sss;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;


public class InvenVO {
	
	Integer qtt, cost, inno, no;
	String outno, code, name, content, client, possi;
	
	Date regdate;

	public String getOutno() {
		return outno;
	}

	public void setOutno(String outno) {
		this.outno = outno;
	}

	public String getPossi() {
		return possi;
	}

	public void setPossi(String possi) {
		this.possi = possi;
	}

	public Integer getNo() {
		return no;
	}

	public void setNo(Integer no) {
		this.no = no;
	}

	public Integer getQtt() {
		return qtt;
	}

	public void setQtt(Integer qtt) {
		this.qtt = qtt;
	}

	public Integer getCost() {
		return cost;
	}

	public void setCost(Integer cost) {
		this.cost = cost;
	}

	public Integer getInno() {
		return inno;
	}

	public void setInno(Integer inno) {
		this.inno = inno;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getClient() {
		return client;
	}

	public void setClient(String client) {
		this.client = client;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "InvenVO [qtt=" + qtt + ", cost=" + cost + ", inno=" + inno + ", no=" + no + ", outno=" + outno
				+ ", code=" + code + ", name=" + name + ", content=" + content + ", client=" + client + ", possi="
				+ possi + ", regdate=" + regdate + "]";
	}

	
}
