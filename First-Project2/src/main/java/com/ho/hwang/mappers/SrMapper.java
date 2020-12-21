package com.ho.hwang.mappers;

import com.ho.hwang.dto.Sr.SelectSrDto;
import com.ho.hwang.dto.Sr.SelectSrListDto;
import com.ho.hwang.vo.SrVo;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
@Mapper
public interface SrMapper {
    int updateSrComplete(SrVo srVo);
    int updateSrDetail(SrVo srVO);
    int deleteSr(int srId);
    List<SelectSrDto> selectSR();
    List<SelectSrListDto> selectSRList(int customerId);
    Optional<SrVo> selectSRDetail(int srId);
    void insertSR(SrVo srVo);
}
