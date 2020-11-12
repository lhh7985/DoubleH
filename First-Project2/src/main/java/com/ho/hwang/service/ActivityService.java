package com.ho.hwang.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ho.hwang.dto.ActivityDTO.InsertActivityDTO;
import com.ho.hwang.dto.ActivityDTO.InsertCustomerActivityDTO;
import com.ho.hwang.dto.ActivityDTO.SelectActivityDTO;
import com.ho.hwang.mappers.UserMapper;
import com.ho.hwang.vo.ActivityVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ActivityService {
	private final UserMapper mapper;

	public void insertActivity(InsertActivityDTO activityVO) {
		mapper.insertActivity(activityVO);
	}

	// 고객사 방문내역 확인
	public List<ActivityVO> selectVisit(int customer_id) {
		return mapper.selectVisit(customer_id);
	}

	// 모든 활동 확인
	public List<SelectActivityDTO> selectActivity() {
		return mapper.selectActivity();
	}

	// 활동완료
	public void updateComplete(int activity_id) {
		String status = mapper.selectComplete(activity_id);
		if (status != "완료")
			mapper.updateComplete(activity_id);
	}

	// 각 고객별 활동 등록 및 검색
	public void insertCustomerActivity(InsertCustomerActivityDTO activityVO) {
		mapper.insertCustomerActivity(activityVO);
	}

	public List<ActivityVO> selectCustomerActivity(int sr_id) {
		return mapper.selectCustomerActivity(sr_id);
	}

}
