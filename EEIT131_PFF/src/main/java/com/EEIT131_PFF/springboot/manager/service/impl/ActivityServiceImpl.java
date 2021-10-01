package com.EEIT131_PFF.springboot.manager.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.EEIT131_PFF.springboot.model.Activity;

import com.EEIT131_PFF.springboot.manager.repository.ActivityRepository;
import com.EEIT131_PFF.springboot.manager.service.ActivityService;

@Service
@Transactional
public class ActivityServiceImpl implements ActivityService {

	@Autowired
	ActivityRepository ActivityRepository;

	@Override
	public List<Activity> findAllActivity() {
		return ActivityRepository.findAllActivity();
	}
	
	@Override
	public Activity findByActivityId(Integer activityId) {
		return ActivityRepository.findByActivityId(activityId);
	}

	@Override
	public void save(Activity activityId) {
		ActivityRepository.save(activityId);
		
	}
	@Override
	public void update(Activity activityId) {
		ActivityRepository.update(activityId);
		
	}

	@Override
	public Activity findById(Integer activityId) {
		return ActivityRepository.findById(activityId);
	}

	@Override
	public void DeleteActivity(Integer activityId) {
		ActivityRepository.DeleteActivity(activityId);
		
	}

	
	@Override
	public Activity findLastActivity() {
		return ActivityRepository.findLastActivity();
	}


	@Override
	public List<Activity> findHowmanyactivity() {
		return ActivityRepository.findHowmanyactivity();
	}

}
