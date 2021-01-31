package erp;

import org.apache.ibatis.type.Alias;

@Alias("SearchVO")
public class SearchVO {
	String search, search1,search2,search3;		//필요한 검색 옵션 추가  날짜나 숫자 받아야되는 겹치는 내용있다면 추가후 디스코드 
	Integer searchstart, searchend, nowPage;

	
	public String getSearch1() {
		return search1;
	}
	public void setSearch1(String search1) {
		this.search1 = search1;
	}
	public String getSearch2() {
		return search2;
	}
	public void setSearch2(String search2) {
		this.search2 = search2;
	}
	public String getSearch3() {
		return search3;
	}
	public void setSearch3(String search3) {
		this.search3 = search3;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public Integer getSearchstart() {
		return searchstart;
	}
	public void setSearchstart(Integer searchstart) {
		this.searchstart = searchstart;
	}
	public Integer getSearchend() {
		return searchend;
	}
	public void setSearchend(Integer searchend) {
		this.searchend = searchend;
	}
	public Integer getNowPage() {
		return nowPage;
	}
	public void setNowPage(Integer nowPage) {
		this.nowPage = nowPage;
	}
	@Override
	public String toString() {
		return "SearchVO [search=" + search + ", searchstart=" + searchstart + ", searchend=" + searchend + ", nowPage="
				+ nowPage + "]";
	}
	
	

}
