package com.EEIT131_PFF.springboot.manager.repository;

import java.util.List;

import com.EEIT131_PFF.springboot.model.Activity;


public interface ActivityRepository {

	List<Activity> findAllActivity();

	Activity findByActivityId(Integer activityId);

	void update(Activity activity);

	void save(Activity activityId);

	Activity findById(Integer activityId);

	void DeleteActivity(Integer activityId);


	
	Activity findLastActivity();

	List<Activity> findHowmanyactivity();

}