package com.EEIT131_PFF.springboot.manager.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.EEIT131_PFF.springboot.model.Member;
import com.EEIT131_PFF.springboot.manager.repository.AdminiMemberRepository;
import com.EEIT131_PFF.springboot.manager.service.AdminiMemberService;

@Service
@Transactional
public class AdminiMemberServiceImpl implements AdminiMemberService {

	@Autowired
	AdminiMemberRepository AdminiMemberRepository;

	@Override
	public List<Member> findAll() {
		return AdminiMemberRepository.findAll();
	}

	@Override
	public Member findByMemberId(Integer memberId) {
		return AdminiMemberRepository.findByMemberId(memberId);
	}

	@Override
	public void save(Member member) {
		if (findByUserId(member.getAccountId()) != null) {
			throw new RuntimeException("帳號已存在，請更換新帳號");
		}
		AdminiMemberRepository.save(member);
	}

	@Override
	public Member findById(Integer memberId) {
		return AdminiMemberRepository.findById(memberId);
	}

	@Override
	public void update(Member memberId) {
		AdminiMemberRepository.update(memberId);
	}

	@Override
	public Member findByUserId(String accountId) {
		return AdminiMemberRepository.findByUserId(accountId);
	}

	@Override
	public void DeleteMember(Integer memberId) {
		AdminiMemberRepository.DeleteMember(memberId);
		
	}

	


}
