package com.ho.hwang.service;

import com.ho.hwang.dto.Sr.InsertSrDto;
import com.ho.hwang.dto.Sr.SelectSrDto;
import com.ho.hwang.dto.Sr.SelectSrListDto;
import com.ho.hwang.dto.Sr.UpdateSrDetailDto;
import com.ho.hwang.mappers.SrMapper;
import com.ho.hwang.mappers.UserMapper;
import com.ho.hwang.vo.SrVo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.security.Principal;
import java.util.List;
import java.util.Optional;

@Service
@Slf4j
@RequiredArgsConstructor
public class SrService {
	private final UserMapper mapper;
	private final SrMapper srMapper;

	@Transactional
	public SrVo insertSR(InsertSrDto insertSrDto, Principal principal) {

		insertSrDto.setSrRegistrant(principal.getName());
		insertSrDto.setSrType(mapper.selectCode(insertSrDto.getType()));

		SrVo srVo = SrVo.builder()
				.customerId(insertSrDto.getCustomerId())
				.productId(insertSrDto.getProductId())
				.srType(insertSrDto.getSrType())
				.importance(insertSrDto.getImportance())
				.srRequestDate(insertSrDto.getSrRequestDate())
				.srTitle(insertSrDto.getSrTitle())
				.srContent(insertSrDto.getSrContent())
				.srRegistrant(insertSrDto.getSrRegistrant())
				.build();
		srMapper.insertSR(srVo);
		return srVo;

	}

	// SR 리스트 확인
	public List<SelectSrDto> selectSR() {
		return srMapper.selectSR();
	}

	// 각 고객사의 sr확인
	public List<SelectSrListDto> selectSRList(int customerId) {
		return srMapper.selectSRList(customerId);
	}

	// SR 내용확인
	public Optional<SrVo> selectSRDetail(int srId) {
		return srMapper.selectSRDetail(srId);
	}

	public int deleteSr(int srId){
		return srMapper.deleteSr(srId);
	}

	public int updateSrComplete(int srId, Principal principal){
		SrVo srVo = new SrVo(srId, "완료", principal.getName());
		return srMapper.updateSrComplete(srVo);
	}

	public int updateSrDetail(UpdateSrDetailDto updateSrDetailDto, Principal principal){
		SrVo srVo = new SrVo(updateSrDetailDto.getSrId(),updateSrDetailDto.getSrTitle(),updateSrDetailDto.getSrContent(),principal.getName());
		return srMapper.updateSrDetail(srVo);
	}
}
