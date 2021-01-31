package erp.model;

public class Kind {
	String cate, menu ,service, mainUrl, asideUrl;
	

	public String getMenu() {
		return menu;
	}

	public void setMenu(String menu) {
		this.menu = menu;
	}

	public String getCate() {
		return cate;
	}

	public void setCate(String cate) {
		this.cate = cate;
	}

	public String getService() {
		return service;
	}

	public void setService(String service) {
		this.service = service;
	}

	public String getMainUrl() {
		return mainUrl;
	}

	public void setMainUrl(String mainUrl) {
		this.mainUrl = mainUrl;
	}

	public String getAsideUrl() {
		return asideUrl;
	}

	public void setAsideUrl(String asideUrl) {
	
		this.asideUrl = asideUrl+".jsp";
	}

	@Override
	public String toString() {
		return "Kind [cate=" + cate + ", service=" + service + ", mainUrl=" + mainUrl + "]";
	}
	
	
	
}
