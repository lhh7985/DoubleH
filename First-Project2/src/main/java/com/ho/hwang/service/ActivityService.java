package com.ho.hwang.service;

import java.security.Principal;
import java.util.List;

import com.ho.hwang.dto.Activity.*;
import com.ho.hwang.vo.ActivityVo;
import org.springframework.stereotype.Service;

import com.ho.hwang.mappers.UserMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ActivityService {
	private final UserMapper mapper;

	public void insertActivity(InsertActivityDTO insertActivityDTO, Principal principal) {
		insertActivityDTO.setActivityRegistrant(mapper.selectName(principal.getName()));
		insertActivityDTO.setActivityType(mapper.selectCode(insertActivityDTO.getType()));
		mapper.insertActivity(insertActivityDTO);
	}

	// 고객사 방문내역 확인
	public List<SelectVisitDTO> selectVisit(int customerId) {
		return mapper.selectVisit(customerId);
	}

	// 모든 활동 확인
	public List<SelectActivityDTO> selectActivity() {
		return mapper.selectActivity();
	}

	// 활동완료
	public void updateComplete(int activityId) {
		String status = mapper.selectComplete(activityId);
		if (status != "완료")
			mapper.updateComplete(activityId);
	}

	// 각 고객별 활동 등록 및 검색
	public void insertCustomerActivity(InsertCustomerActivityDTO insertCustomerActivityDTO, Principal principal) {
		insertCustomerActivityDTO.setActivityRegistrant(mapper.selectName(principal.getName()));
		insertCustomerActivityDTO.setActivityType(mapper.selectCode(insertCustomerActivityDTO.getType()));
		mapper.insertCustomerActivity(insertCustomerActivityDTO);
	}

	public List<SelectCustomerActivityDTO> selectCustomerActivity(int srId) {
		return mapper.selectCustomerActivity(srId);
	}

}
