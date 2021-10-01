package com.EEIT131_PFF.springboot.users.service.impl;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.EEIT131_PFF.springboot.model.Bookmark;
import com.EEIT131_PFF.springboot.model.Member;
import com.EEIT131_PFF.springboot.model.MemberHealth;
import com.EEIT131_PFF.springboot.model.OrderDetails;
import com.EEIT131_PFF.springboot.model.SavedPayment;
import com.EEIT131_PFF.springboot.users.repository.MemberRepository;
import com.EEIT131_PFF.springboot.users.service.MemberService;

@Service
@Transactional
public class MemberServiceImpl implements MemberService{
    
	@Autowired
	MemberRepository memberRepository;
	
	@Override
	public Member selectById(String accountId) {
		return memberRepository.selectById(accountId);
	}
	@Override
	public void saveHealth(MemberHealth memberHealth) {
		memberRepository.saveHealth(memberHealth);
	}

	@Override
	public void save(Member member) {
        memberRepository.save(member);		
	}

	@Override
	public void merge(Member member) {
        memberRepository.merge(member);		
	}

	@Override
	public Member findByActiveCode(String ActiveCode) {
		return memberRepository.findByActiveCode(ActiveCode);
	}

	@Override
	public List<SavedPayment> findSavedPaymentById(String accountId) {
		return memberRepository.findSavedPaymentById(accountId);
		
	}

	@Override
	public void merge(SavedPayment savedPayment) {
        memberRepository.merge(savedPayment);		
		
	}

	@Override
	public void save(SavedPayment savedPayment) {
		memberRepository.save(savedPayment);	
	}

	@Override
	public void deletePayment(Integer svId) {
		memberRepository.deletePayment(svId);	
		
	}

	@Override
	public Boolean hasPayment(String account, Integer SavedPaymentId) {
		return memberRepository.hasPayment(account, SavedPaymentId);
	}

	@Override
	public void deleteBookmark(Integer productId, Member account) {
		memberRepository.deleteBookmark(productId, account);
	}

	@Override
	public List<OrderDetails> selectAllPurchaseRecord(Integer memberId) {
		return memberRepository.selectAllPurchaseRecord(memberId);
	}

	@Override
	public OrderDetails selectPurchaseRecord(Integer orderId) {
		return memberRepository.selectPurchaseRecord(orderId);
	}
	@Override
	public List<Bookmark> selectFromBookmarkBymemberId(Integer memberId){
		return memberRepository.selectFromBookmarkBymemberId(memberId);
	}

	@Override
	public Boolean updateMemberPwd(String password, Integer memberId) {
		return memberRepository.updateMemberPwd(password, memberId);
	}

	@Override
	public Boolean hasEmail(String email) {
		return memberRepository.hasEmail(email);
	}

	@Override
	public Member selectByEmail(String email) {
		return memberRepository.selectByEmail(email);
	}

	@Override
	public void updateMemberActiveCode(String randomCode, Integer memberId) {
		memberRepository.updateMemberActiveCode(randomCode, memberId);		
	}
	@Override
	public void mergeMemberHealth(MemberHealth memberHealth) {
		memberRepository.mergeMemberHealth(memberHealth);				
	}

	


}
