package erp.sss;

import java.util.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;


public class Inven_outVO {
	
	Integer qtt, outqtt, cost;
	String outno, code, name, content, client, outch, outdate;
	
	Date regdate;

	public String getOutch() {
		return outch;
	}

	public void setOutch(String outch) {
		this.outch = outch;
	}

	public Integer getQtt() {
		return qtt;
	}

	public void setQtt(Integer qtt) {
		this.qtt = qtt;
	}

	public Integer getOutqtt() {
		return outqtt;
	}

	public void setOutqtt(Integer outqtt) {
		this.outqtt = outqtt;
	}

	public Integer getCost() {
		return cost;
	}

	public void setCost(Integer cost) {
		this.cost = cost;
	}

	public String getOutno() {
		return outno;
	}

	public void setOutno(String outno) {
		this.outno = outno;
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

	
	/*
	 * public Date getOutdate() { return outdate; }
	 * 
	 * public void setOutdate(Date outdate) { this.outdate = outdate; }
	 */

	public String getOutdate() {
		return outdate;
	}

	public void setOutdate(String outdate) {
		this.outdate = outdate;
	}

	@Override
	public String toString() {
		return "Inven_outVO [qtt=" + qtt + ", outqtt=" + outqtt + ", cost=" + cost + ", outno=" + outno + ", code="
				+ code + ", name=" + name + ", content=" + content + ", client=" + client + ", outch=" + outch
				+ ", regdate=" + regdate + ", outdate=" + outdate + "]";
	}
	
	
	
}
