package com.ho.hwang.service;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Optional;

import com.ho.hwang.dto.Activity.*;
import com.ho.hwang.mappers.ActivityMapper;
import com.ho.hwang.mappers.CustomerMapper;
import com.ho.hwang.vo.ActivityVo;
import org.springframework.stereotype.Service;

import com.ho.hwang.mappers.UserMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ActivityService {
	private final ActivityMapper activityMapper;
	private final UserMapper mapper;
	private final CustomerMapper customerMapper;

	public ActivityVo insertActivity(InsertActivityDto insertActivityDto, Principal principal) {
		insertActivityDto.setActivityRegistrant(mapper.selectName(principal.getName()));
		insertActivityDto.setActivityType(mapper.selectCode(insertActivityDto.getType()));

		ActivityVo activityVo = ActivityVo.insertBuilder()
				.activityContent(insertActivityDto.getActivityContent())
				.activityTitle(insertActivityDto.getActivityTitle())
				.activityEstimatedDate(insertActivityDto.getActivityEstimatedDate())
				.activityStatus(insertActivityDto.getActivityStatus())
				.activityType(insertActivityDto.getActivityType())
				.activityRegistrant(insertActivityDto.getActivityRegistrant())
				.build();

		activityMapper.insertActivity(activityVo);
		return activityVo;
	}


	// 모든 활동 확인
	public List<SelectActivityDto> selectActivity() {
		return activityMapper.selectActivity();
	}

	// 활동완료
	public int updateComplete(int activityId) {
		String status = activityMapper.selectComplete(activityId);
		if (status != "완료") {
			return activityMapper.updateComplete(activityId);
		}
		else{
			return 0;
		}
	}

	// 각 고객별 활동 등록 및 검색
	public ActivityVo insertCustomerActivity(InsertCustomerActivityDto insertCustomerActivityDto, Principal principal) {
		insertCustomerActivityDto.setActivityRegistrant(mapper.selectName(principal.getName()));
		insertCustomerActivityDto.setActivityType(mapper.selectCode(insertCustomerActivityDto.getType()));

		ActivityVo activityVo = ActivityVo.insertBuilder()
				.srId(insertCustomerActivityDto.getSrId())
				.activityTitle(insertCustomerActivityDto.getActivityTitle())
				.activityContent(insertCustomerActivityDto.getActivityContent())
				.activityType(insertCustomerActivityDto.getActivityType())
				.activityEstimatedDate(insertCustomerActivityDto.getActivityEstimatedDate())
				.activityRegistrant(insertCustomerActivityDto.getActivityRegistrant())
				.activityStatus(insertCustomerActivityDto.getActivityStatus())
				.build();

		customerMapper.insertCustomerActivity(activityVo);
		return activityVo;

	}

	public List<ActivityVo> selectCustomerActivity(int srId) {
		return customerMapper.selectCustomerActivity(srId);
	}

	public Optional<ActivityVo> selectActivityDetail(int activityId){
	    return activityMapper.selectActivityDetail(activityId);
    }

    public int updateActivity(UpdateActivityDto updateActivityDto, Principal principal){
		ActivityVo activityVo = ActivityVo.builder()
				.activityId(updateActivityDto.getActivityId())
				.activityTitle(updateActivityDto.getActivityTitle())
				.activityContent(updateActivityDto.getActivityContent())
				.activityEstimatedDate(updateActivityDto.getActivityEstimatedDate())
				.activityModifier(principal.getName())
				.activityEstimatedCompletionDate(updateActivityDto.getActivityEstimatedCompletionDate())
				.build();
		return activityMapper.updateActivity(activityVo);


	}

	public int deleteActivity(int activityId){
		return activityMapper.deleteActivity(activityId);
	}
}
