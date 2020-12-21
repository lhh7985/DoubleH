package com.ho.hwang.mappers;

import com.ho.hwang.dto.Activity.SelectActivityDto;
import com.ho.hwang.vo.ActivityVo;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
@Mapper
public interface ActivityMapper {

    void insertActivity(ActivityVo activityVo);

    Optional<ActivityVo> selectActivityDetail(int activityId);
    int deleteActivity(int activityId);
    //모든 활동 확인
    List<SelectActivityDto> selectActivity();

    int updateActivity(ActivityVo activityVo);

    //활동 완료
    int updateComplete(int activityId);
    String selectComplete(int activityId);
}
