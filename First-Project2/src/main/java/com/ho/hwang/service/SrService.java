package com.ho.hwang.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ho.hwang.mappers.UserMapper;
import com.ho.hwang.vo.SrVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SrService {
	private final UserMapper mapper;

	public void insertSR(SrVO srVO) {
		mapper.insertSR(srVO);
	}

	// SR 리스트 확인
	public List<SrVO> selectSR() {
		return mapper.selectSR();
	}

	// 각 고객사의 sr확인
	public List<SrVO> selectSRList(int customer_id) {
		return mapper.selectSRList(customer_id);
	}

	// SR 내용확인
	public SrVO selectSRDetail(int sr_id) {
		return mapper.selectSRDetail(sr_id);
	}

}
