package my.shop;

/*create table category(
		cnum 	number primary key,
		code 	varchar2(20) not null,
		cname 	varchar2(50) not null
	);*/

public class CategoryDTO {
	private int cnum;
	private String code;
	private String cname;
	
	
	public int getCnum() {
		return cnum;
	}
	public void setCnum(int cnum) {
		this.cnum = cnum;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
}
