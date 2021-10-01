package com.EEIT131_PFF.springboot.cart.vo;

import java.math.BigDecimal;

public class CartVo {
	private Integer productId;
	private String  productName;
	private BigDecimal price;
	private Integer quantity;
	private Double  discount;
	private Integer money;
	private Double total;
	
	public Integer getProductId() {
		return productId;
	}
	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public Double getDiscount() {
		return discount;
	}
	public void setDiscount(Double discount) {
		this.discount = discount;
	}
	
	public Integer getMoney() {
		return money;
	}
	public void setMoney(Integer money) {
		this.money = money;
	}
	public Double getTotal() {
		return total;
	}
	public void setTotal(Double total) {
		this.total = total;
	}
	
	
	


	
	

	@Override
	public String toString() {
		return "CartVo [productId=" + productId + ", productName=" + productName + ", price=" + price + ", quantity="
				+ quantity + ", discount=" + discount + ", money=" + money + ", total=" + total + "]";
	}
	public String toJSON() {
		StringBuilder builder = new StringBuilder();
		builder.append("{ \"productId\":");
		builder.append('\"'+productId+'\"');
		builder.append(", \"quantity\":");
		builder.append('\"'+quantity+'\"');
		builder.append(", \"discount\":");
		builder.append('\"'+discount+'\"');
		builder.append(", \"money\":");
		builder.append('\"'+money+'\"');
		builder.append(", \"total\":\"");
		builder.append(total);
		builder.append("}");
		return builder.toString();
	}
	

}
