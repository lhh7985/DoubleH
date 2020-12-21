package com.ho.hwang.service;


import com.ho.hwang.dto.patch.InsertPatchDto;
import com.ho.hwang.mappers.PatchMapper;
import com.ho.hwang.vo.PackageVo;
import com.ho.hwang.vo.PatchHistoryVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.util.List;

@Service
@RequiredArgsConstructor
public class PatchService {
    private final PatchMapper mapper;

    public List<PatchHistoryVo> selectPatchList(){
        return mapper.selectPatchList();
    }

    public List<PackageVo> selectPackageList(){
        return mapper.selectPackageList();
    }

    //나중에 VO로 리턴하도록 수정
    public PatchHistoryVo insertPatch(InsertPatchDto insertPatchDto, Principal principal){
        insertPatchDto.setPatchRegistrant(principal.getName());
        PatchHistoryVo patchHistoryVo = PatchHistoryVo.builder()
                .deliveryId(insertPatchDto.getDeliveryId())
                .packageId(insertPatchDto.getPackageId())
                .patchContent(insertPatchDto.getPatchContent())
                .patchDate(insertPatchDto.getPatchDate())
                .patchRegistrant(insertPatchDto.getPatchRegistrant())
                .patchTitle(insertPatchDto.getPatchTitle())
                .build();
        mapper.insertPatch(insertPatchDto);

        return patchHistoryVo;
    }
}
