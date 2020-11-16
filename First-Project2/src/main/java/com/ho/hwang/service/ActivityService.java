package com.ho.hwang.service;

import java.security.Principal;
import java.util.List;

import com.ho.hwang.dto.Activity.*;
import org.springframework.stereotype.Service;

import com.ho.hwang.mappers.UserMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ActivityService {
	private final UserMapper mapper;

	public void insertActivity(InsertActivityDTO insertActivityDTO, Principal principal) {
		insertActivityDTO.setActivity_registrant(mapper.selectName(principal.getName()));
		insertActivityDTO.setActivity_type(mapper.selectCode(insertActivityDTO.getType()));
		mapper.insertActivity(insertActivityDTO);
	}

	// 고객사 방문내역 확인
	public List<SelectVisitDTO> selectVisit(int customer_id) {
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
	public void insertCustomerActivity(InsertCustomerActivityDTO insertCustomerActivityDTO, Principal principal) {
		insertCustomerActivityDTO.setActivity_registrant(mapper.selectName(principal.getName()));
		insertCustomerActivityDTO.setActivity_type(mapper.selectCode(insertCustomerActivityDTO.getType()));
		mapper.insertCustomerActivity(insertCustomerActivityDTO);
	}

	public List<SelectCustomerActivityDTO> selectCustomerActivity(int sr_id) {
		return mapper.selectCustomerActivity(sr_id);
	}

}
