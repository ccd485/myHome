package my.shop;

/*create table product(
	pnum 		number primary key,
	pname 		varchar2(50) not null,
	pcategory_fk  	varchar2(20) not null,
	pcompany 	varchar2(50),
	pimage   		varchar2(30),
	pqty		number,
	price   		number,
	pspec   		varchar2(12),
	pcontents 	varchar2(300),
	point   		number,
	pinputdate 	varchar2(10)
);*/

public class ProductDTO {
	private int pnum;
	private String pname;
	private String pcategory_fk;
	private String pcompany;
	private String pimage;
	private int pqty;
	private int price;
	private String pspec;
	private String pcontents;
	private int point;
	private String pinputdate;
	
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPcategory_fk() {
		return pcategory_fk;
	}
	public void setPcategory_fk(String pcategory_fk) {
		this.pcategory_fk = pcategory_fk;
	}
	public String getPcompany() {
		return pcompany;
	}
	public void setPcompany(String pcompany) {
		this.pcompany = pcompany;
	}
	public String getPimage() {
		return pimage;
	}
	public void setPimage(String pimage) {
		this.pimage = pimage;
	}
	public int getPqty() {
		return pqty;
	}
	public void setPqty(int pqty) {
		this.pqty = pqty;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getPspec() {
		return pspec;
	}
	public void setPspec(String pspec) {
		this.pspec = pspec;
	}
	public String getPcontents() {
		return pcontents;
	}
	public void setPcontents(String pcontents) {
		this.pcontents = pcontents;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getPinputdate() {
		return pinputdate;
	}
	public void setPinputdate(String pinputdate) {
		this.pinputdate = pinputdate;
	}
	
	
	
}
