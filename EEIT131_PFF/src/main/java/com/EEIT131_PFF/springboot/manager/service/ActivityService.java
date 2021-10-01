package com.EEIT131_PFF.springboot.manager.service;

import java.util.List;

import com.EEIT131_PFF.springboot.model.Activity;


public interface ActivityService {

	List<Activity> findAllActivity();
	
	void save(Activity activityId);

	void update(Activity activity);

	Activity findByActivityId(Integer activityId);

	Activity findById(Integer activityId);

	void DeleteActivity(Integer activityId);



	Activity findLastActivity();

	List<Activity> findHowmanyactivity();


}