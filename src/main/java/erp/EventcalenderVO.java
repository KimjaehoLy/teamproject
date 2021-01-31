package erp;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("EventcalenderVO")
public class EventcalenderVO {
	Integer eve_eventid;
	String eve_subject, eve_description, eve_start, eve_end, eve_themecolor, eve_isfullday;
	public Integer getEve_eventid() {
		return eve_eventid;
	}
	public void setEve_eventid(Integer eve_eventid) {
		this.eve_eventid = eve_eventid;
	}
	public String getEve_subject() {
		return eve_subject;
	}
	public void setEve_subject(String eve_subject) {
		this.eve_subject = eve_subject;
	}
	public String getEve_description() {
		return eve_description;
	}
	public void setEve_description(String eve_description) {
		this.eve_description = eve_description;
	}
	public String getEve_start() {
		return eve_start;
	}
	public void setEve_start(String eve_start) {
		this.eve_start = eve_start;
	}
	public String getEve_end() {
		return eve_end;
	}
	public void setEve_end(String eve_end) {
		this.eve_end = eve_end;
	}
	public String getEve_themecolor() {
		return eve_themecolor;
	}
	public void setEve_themecolor(String eve_themecolor) {
		this.eve_themecolor = eve_themecolor;
	}
	public String getEve_isfullday() {
		return eve_isfullday;
	}
	public void setEve_isfullday(String eve_isfullday) {
		this.eve_isfullday = eve_isfullday;
	}
	@Override
	public String toString() {
		return "{\"eve_eventid\":\"" + eve_eventid + "\", \"eve_subject\":\"" + eve_subject + "\", \"eve_description\":\""
				+ eve_description + "\", \"eve_start\":\"" + eve_start + "\", \"eve_end\":\"" + eve_end + "\", \"eve_themecolor\":\""
				+ eve_themecolor + "\", \"eve_isfullday\":\"" + eve_isfullday + "\"}";
	}

	
	
	
}
