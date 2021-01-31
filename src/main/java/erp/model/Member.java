package erp.model;

public class Member {

	String pid, pname, pw, sysFile, oriFile, sysFile2, oriFile2, type;
	
	boolean upfile2Img;
	
	
	


	public boolean isUpfile2Img() {
		return upfile2Img;
	}

	public void setUpfile2Img(boolean upfile2Img) {
		this.upfile2Img = upfile2Img;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getSysFile2() {
		return sysFile2;
	}

	public void setSysFile2(String sysFile2) {
		this.sysFile2 = sysFile2;
	}

	public String getOriFile2() {
		return oriFile2;
	}

	public void setOriFile2(String oriFile2) {
		this.oriFile2 = oriFile2;
	}

	public String getSysFile() {
		return sysFile;
	}

	public void setSysFile(String sysFile) {
		this.sysFile = sysFile;
	}

	public String getOriFile() {
		return oriFile;
	}

	public void setOriFile(String oriFile) {
		this.oriFile = oriFile;
	}

	public Member() {
		
	}

	public Member(String pid) {
		super();
		this.pid = pid;
	}

	public Member(String pid, String pw,  String pname) {
		super();
		this.pid = pid;
		this.pname = pname;
		this.pw = pw;
	}

	public String getPid() {
		return pid;
	}

	public String getPname() {
		return pname;
	}

	public String getPw() {
		return pw;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((pid == null) ? 0 : pid.hashCode());
		result = prime * result + ((pw == null) ? 0 : pw.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Member other = (Member) obj;
		if (pid == null) {
			if (other.pid != null)
				return false;
		} else if (!pid.equals(other.pid))
			return false;
		if (pw == null) {
			if (other.pw != null)
				return false;
		} else if (!pw.equals(other.pw))
			return false;
		return true;
	}
	
	
	
}
