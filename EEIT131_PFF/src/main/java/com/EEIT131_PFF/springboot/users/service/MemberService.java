package com.EEIT131_PFF.springboot.users.service;


import java.util.List;

import com.EEIT131_PFF.springboot.model.Bookmark;
import com.EEIT131_PFF.springboot.model.Member;
import com.EEIT131_PFF.springboot.model.MemberHealth;
import com.EEIT131_PFF.springboot.model.OrderDetails;
import com.EEIT131_PFF.springboot.model.SavedPayment;




public interface MemberService {
	
	public void merge(Member member);

	public Member selectById(String accountId);

	public void save(Member member);

	public Member findByActiveCode(String ActiveCode);

	//用AccountId找出對應的SavedPayment
	public List<SavedPayment> findSavedPaymentById(String accountId);

	public void merge(SavedPayment savedPayment);

	public void save(SavedPayment savedPayment);

	public void deletePayment(Integer svId);
	
	public Boolean hasPayment(String account, Integer SavedPaymentId);

	public void deleteBookmark(Integer productId, Member account);

	public List<OrderDetails> selectAllPurchaseRecord(Integer memberId);

	public OrderDetails selectPurchaseRecord(Integer orderId);

	public List<Bookmark> selectFromBookmarkBymemberId(Integer memberId);
	
	public Boolean updateMemberPwd(String password, Integer memberId);

	public Boolean hasEmail(String frontEmail);

	public Member selectByEmail(String email);

	public void updateMemberActiveCode(String randomCode, Integer memberId);

	void saveHealth(MemberHealth memberHealth);

	public void mergeMemberHealth(MemberHealth memberHealth);

}
