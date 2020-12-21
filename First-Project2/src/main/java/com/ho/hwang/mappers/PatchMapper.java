package com.ho.hwang.mappers;

import com.ho.hwang.dto.patch.InsertPatchDto;
import com.ho.hwang.vo.PackageVo;
import com.ho.hwang.vo.PatchHistoryVo;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
@Mapper
public interface PatchMapper {
    List<PatchHistoryVo> selectPatchList();
    List<PackageVo> selectPackageList();
    void insertPatch(InsertPatchDto insertPatchDto);

}
