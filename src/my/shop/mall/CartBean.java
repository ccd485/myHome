package my.shop.mall;

import java.util.*;
import my.shop.*;

public class CartBean {
	Hashtable<String, ProductDTO> ht;
	ProductList prodlist;
	
	public CartBean() {
		ht = new Hashtable<>();
	}

	public void setProdlist(ProductList prodlist) {
		this.prodlist = prodlist;
	}

	public boolean addCart(String pnum, String select, int qty) {
		if (ht.containsKey(pnum)) {
			ProductDTO dto = ht.get(pnum);
			dto.setPqty(dto.getPqty()+qty);
		}else {
			ProductDTO dto = prodlist.getProduct(Integer.parseInt(pnum), select);
			dto.setPqty(qty);
			ht.put(pnum, dto);
		}
		return true;
	}
	
	public Hashtable<String, ProductDTO> listCart() {
		return ht;
	}
	
	public void editCart(String pnum, int pqty) {
		if (pqty==0) {
			deleteCart(pnum);
		}else {
			ProductDTO dto = ht.get(pnum);
			dto.setPqty(pqty);
		}
	}
	
	public void deleteCart(String pnum) {
		ht.remove(pnum);
	}
}






