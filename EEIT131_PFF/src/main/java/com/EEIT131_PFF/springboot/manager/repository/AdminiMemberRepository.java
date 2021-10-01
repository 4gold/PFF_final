package com.EEIT131_PFF.springboot.manager.repository;

import java.util.List;

import com.EEIT131_PFF.springboot.model.Member;

public interface AdminiMemberRepository {

	List<Member> findAll();

	void save(Member memberId);

	void update(Member member);

	Member findById(Integer memberId);

	Member findByUserId(String accountId);

	Member findByMemberId(Integer memberId);

	void DeleteMember(Integer memberId);

	

}