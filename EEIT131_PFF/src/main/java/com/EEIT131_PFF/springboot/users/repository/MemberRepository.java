package com.EEIT131_PFF.springboot.users.repository;



import java.util.List;

import com.EEIT131_PFF.springboot.model.Bookmark;
import com.EEIT131_PFF.springboot.model.Member;
import com.EEIT131_PFF.springboot.model.MemberHealth;
import com.EEIT131_PFF.springboot.model.OrderDetails;
import com.EEIT131_PFF.springboot.model.SavedPayment;




public interface MemberRepository {

	public void merge(Member member);
	
	Member selectById(String accountId) ;
	
	public void saveHealth(MemberHealth memberHealth);

	void save(Member member);

	public Member findByActiveCode(String ActiveCode);
	
	public List<SavedPayment> findSavedPaymentById(String accountId);
	public void merge(SavedPayment savedPayment);

	public void save(SavedPayment savedPayment);

	public void deletePayment(Integer svId);

	public Boolean hasPayment(String account, Integer savedPaymentId);

	public void deleteBookmark(Integer productId, Member account);

	public List<OrderDetails> selectAllPurchaseRecord(Integer memberId);

	public OrderDetails selectPurchaseRecord(Integer orderId);

	public List<Bookmark> selectFromBookmarkBymemberId(Integer memberId);

	public Boolean updateMemberPwd(String password, Integer memberId);

	public Boolean hasEmail(String email);

	public Member selectByEmail(String email);

	public void updateMemberActiveCode(String randomCode, Integer memberId);

	public void mergeMemberHealth(MemberHealth memberHealth);

	

    
}
