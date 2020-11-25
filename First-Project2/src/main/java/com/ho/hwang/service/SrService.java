package com.ho.hwang.service;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.ho.hwang.dto.Sr.InsertSrDto;
import com.ho.hwang.dto.Sr.SelectSrDto;
import com.ho.hwang.dto.Sr.SelectSrListDto;
import com.ho.hwang.vo.SrVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import com.ho.hwang.mappers.UserMapper;

import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;

@Service
@Slf4j
@RequiredArgsConstructor
public class SrService {
	private final UserMapper mapper;
	public final static SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	@Transactional
	public void insertSR(InsertSrDto insertSrDto, Principal principal) {
		Date time = new Date();

		String name = mapper.selectName(principal.getName());
		insertSrDto.setSrRegistrant(name);

		// 현재 날짜 삽입
		insertSrDto.setSrRegistrationDate(fmt.format(time));

		int typeConvert = mapper.selectCode(insertSrDto.getType());
		insertSrDto.setSrType(typeConvert);
		log.info(String.valueOf(typeConvert));
		int cuId = mapper.selectCustomerID(insertSrDto.getCustomerName());
		int pId = mapper.selectProductID(insertSrDto.getProductName());

		insertSrDto.setCustomerId(cuId);
		insertSrDto.setProductId(pId);

		mapper.insertSR(insertSrDto);
	}

	// SR 리스트 확인
	public List<SelectSrDto> selectSR(int start, int cntPerPage) {
		return mapper.selectSR(start, cntPerPage);
	}
	//SR 충 개수
	public int selectSrTotalCount(){
		return mapper.selectSrTotalCount();
	}

	// 각 고객사의 sr확인
	public List<SelectSrListDto> selectSRList(int customerId) {
		return mapper.selectSRList(customerId);
	}

	// SR 내용확인
	public SrVo selectSRDetail(int srId) {
		return mapper.selectSRDetail(srId);
	}

}
