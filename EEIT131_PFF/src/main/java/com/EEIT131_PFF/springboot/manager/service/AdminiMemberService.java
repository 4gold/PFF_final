package com.EEIT131_PFF.springboot.manager.service;

import java.util.List;

import com.EEIT131_PFF.springboot.model.Member;

public interface AdminiMemberService {

	List<Member> findAll();

	void save(Member memberId);

	void update(Member memberId);

	Member findById(Integer memberId);

	Member findByUserId(String accountId);

	Member findByMemberId(Integer memberId);

	void DeleteMember(Integer memberId);



}