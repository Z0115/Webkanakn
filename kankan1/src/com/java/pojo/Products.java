package com.java.pojo;

//商品管理实体类
public class Products {
	private Integer shoppingid;
	private String shoppingname;
	private double costprice;
	private double rulingprice;
	private String adress;
	private String addtime;
	private String shentai;
	private String zhuangtai;
	public Integer getShoppingid() {
		return shoppingid;
	}
	public void setShoppingid(Integer shoppingid) {
		this.shoppingid = shoppingid;
	}
	public String getShoppingname() {
		return shoppingname;
	}
	public void setShoppingname(String shoppingname) {
		this.shoppingname = shoppingname;
	}
	public double getCostprice() {
		return costprice;
	}
	public void setCostprice(double costprice) {
		this.costprice = costprice;
	}
	public double getRulingprice() {
		return rulingprice;
	}
	public void setRulingprice(double rulingprice) {
		this.rulingprice = rulingprice;
	}
	public String getAdress() {
		return adress;
	}
	public void setAdress(String adress) {
		this.adress = adress;
	}
	public String getAddtime() {
		return addtime;
	}
	public void setAddtime(String addtime) {
		this.addtime = addtime;
	}
	public String getShentai() {
		return shentai;
	}
	public void setShentai(String shentai) {
		this.shentai = shentai;
	}
	public String getZhuangtai() {
		return zhuangtai;
	}
	public void setZhuangtai(String zhuangtai) {
		this.zhuangtai = zhuangtai;
	}
	public Products(Integer shoppingid, String shoppingname, double costprice, double rulingprice, String adress,
			String addtime, String shentai, String zhuangtai) {
		super();
		this.shoppingid = shoppingid;
		this.shoppingname = shoppingname;
		this.costprice = costprice;
		this.rulingprice = rulingprice;
		this.adress = adress;
		this.addtime = addtime;
		this.shentai = shentai;
		this.zhuangtai = zhuangtai;
	}
	public Products() {
		super();
	}
	@Override
	public String toString() {
		return "Products [shoppingid=" + shoppingid + ", shoppingname=" + shoppingname + ", costprice=" + costprice
				+ ", rulingprice=" + rulingprice + ", adress=" + adress + ", addtime=" + addtime + ", shentai="
				+ shentai + ", zhuangtai=" + zhuangtai + "]";
	}
	
	
	
}
