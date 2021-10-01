package com.EEIT131_PFF.springboot.manager.repository.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;
import javax.persistence.OptimisticLockException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.EEIT131_PFF.springboot.model.Activity;
import com.EEIT131_PFF.springboot.manager.repository.ActivityRepository;

@Repository
public class ActivityRepositoryImpl implements ActivityRepository {

	@Autowired
	EntityManager entityManager;

	@Override
	public List<Activity> findAllActivity() {
		String hql = "FROM   Activity";
		return entityManager.createQuery(hql, Activity.class).getResultList();
	}

	@Override
	public Activity findByActivityId(Integer activityId) {
		String hql = "FROM Activity a WHERE a.activityId = :activityId";
		Activity act = null;
		try {
			act = entityManager.createQuery(hql, Activity.class)
					           .setParameter("activityId", activityId)
					           .getSingleResult();
		} catch (NoResultException e) {
			;
		} catch (NonUniqueResultException e) {
			;
		}
		return act;
	}

	@Override
	public void update(Activity activity) {
		Activity activity0 = findByActivityId(activity.getActivityId());
		entityManager.detach(activity0);
		entityManager.merge(activity);
	}

	@Override
	public void save(Activity activityId) {
		entityManager.persist(activityId);
		
	}

	public Activity findById(Integer activityId) {
		return entityManager.find(Activity.class, activityId);
	}
	
	public Activity findLastActivity() {
		String hql = "FROM Activity ORDER BY activityId DESC";
		
		return entityManager.createQuery(hql, Activity.class).setMaxResults(1).getSingleResult();
	}
	
	//刪除方式
		@Override
		public void DeleteActivity(Integer activityId) {
			String hql = "DELETE FROM Activity a WHERE a.activityId = :activityId";
			try {		
				int isSuccess = entityManager.createQuery(hql)
						                     .setParameter("activityId", activityId)
						                     .executeUpdate();
				if(isSuccess==0) {
			        throw new OptimisticLockException("刪除失敗");
				}
			}catch(Exception e) {
				e.printStackTrace();
				throw new RuntimeException("刪除失敗");
			}
			System.out.println("savedActivity delete");
		}

		


		@Override
		public List<Activity> findHowmanyactivity() {
			String hql = " SELECT COUNT(*) FROM Activity ";
			System.out.println();
			return entityManager.createQuery(hql, Activity.class).getResultList();
		
		};

}
