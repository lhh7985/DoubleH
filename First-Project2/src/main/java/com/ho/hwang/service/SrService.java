package com.ho.hwang.service;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

import com.ho.hwang.dto.Sr.InsertSrDTO;
import com.ho.hwang.dto.Sr.SelectSrDTO;
import com.ho.hwang.dto.Sr.SelectSrDetailDTO;
import com.ho.hwang.dto.Sr.SelectSrListDTO;
import com.ho.hwang.vo.SrVO;
import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.LoggerFactory;
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
	public void insertSR(InsertSrDTO insertSrDTO, Principal principal) {
		Date time = new Date();

		String name = mapper.selectName(principal.getName());
		insertSrDTO.setSrRegistrant(name);

		// 현재 날짜 삽입
		insertSrDTO.setSrRegistrationDate(fmt.format(time));

		int typeConvert = mapper.selectCode(insertSrDTO.getType());
		insertSrDTO.setSrType(typeConvert);
		log.info(String.valueOf(typeConvert));
		int cuId = mapper.selectCustomerID(insertSrDTO.getCustomerName());
		int pId = mapper.selectProductID(insertSrDTO.getProductName());

		insertSrDTO.setCustomerId(cuId);
		insertSrDTO.setProductId(pId);

		mapper.insertSR(insertSrDTO);
	}

	// SR 리스트 확인
	public List<SelectSrDTO> selectSR(int start, int cntPerPage) {
		return mapper.selectSR(start, cntPerPage);
	}
	//SR 충 개수
	public int selectSrTotalCount(){
		return mapper.selectSrTotalCount();
	}

	// 각 고객사의 sr확인
	public List<SelectSrListDTO> selectSRList(int customerId) {
		return mapper.selectSRList(customerId);
	}

	// SR 내용확인
	public SrVO selectSRDetail(int srId) {
		return mapper.selectSRDetail(srId);
	}

}
