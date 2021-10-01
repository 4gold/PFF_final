package com.EEIT131_PFF.springboot.manager.repository.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;
import javax.persistence.OptimisticLockException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.EEIT131_PFF.springboot.model.Member;
import com.EEIT131_PFF.springboot.manager.repository.AdminiMemberRepository;

@Repository
public class AdminiMemberRepositoryImpl implements AdminiMemberRepository {

	@Autowired
	EntityManager entityManager;

	@Override
	public List<Member> findAll() {
		String hql = "FROM Member";
		return entityManager.createQuery(hql, Member.class).getResultList();
	}
	
    //accountId 找尋資料表中有無重複id的方式
	@Override
	public Member findByUserId(String accountId) {
		String hql = "FROM Member m WHERE m.accountId = :accountId";
		Member user = null;
		try {
			user = entityManager.createQuery(hql, Member.class)
					            .setParameter("accountId", accountId)
					            .getSingleResult();
		} catch (NoResultException e) {
			;
		} catch (NonUniqueResultException e) {
			;
		}
		return user;
	}
	
	 //找尋資料表中memberid
	@Override
	public Member findByMemberId(Integer memberId) {
		String hql = "FROM Member m WHERE m.memberId = :memberId";
		Member user = null;
		try {
			user = (Member)entityManager.createQuery(hql, Member.class)
					            .setParameter("memberId", memberId)
					            .getSingleResult();
		} catch (NoResultException e) {
			;
		} catch (NonUniqueResultException e) {
			;
		}
		return user;
	}
	//新增方式
	@Override
	public void save(Member memberId) {
		entityManager.persist(memberId);
	}

	
	
	@Override
	public void update(Member member) {
		Member member0 = findByMemberId(member.getMemberId());
		entityManager.detach(member0);
		entityManager.merge(member);
	}


	
	@Override
	public Member findById(Integer memberId) {
		return entityManager.find(Member.class, memberId);
	}

	
	//刪除方式
	@Override
	public void DeleteMember(Integer memberId) {
		String hql = "DELETE FROM Member m WHERE m.memberId = :memberId";
		try {		
			int isSuccess = entityManager.createQuery(hql)
					                     .setParameter("memberId", memberId)
					                     .executeUpdate();
			if(isSuccess==0) {
		        throw new OptimisticLockException("刪除失敗");
			}
		}catch(Exception e) {
			e.printStackTrace();
			throw new RuntimeException("刪除失敗");
		}
		System.out.println("savedMember delete");
	};
	
	
}
