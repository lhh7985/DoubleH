package com.ho.hwang.mappers;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import com.ho.hwang.dto.Activity.*;
import com.ho.hwang.dto.Code.UpdateCodeDto;
import com.ho.hwang.dto.Customer.*;
import com.ho.hwang.dto.Employee.*;
import com.ho.hwang.dto.ManagerHistory.SelectManagerDto;
import com.ho.hwang.dto.ManagerHistory.UpdateManagerHistoryDto;
import com.ho.hwang.dto.Product.*;
import com.ho.hwang.dto.Sr.InsertSrDto;
import com.ho.hwang.dto.Sr.SelectSrDto;
import com.ho.hwang.dto.Sr.SelectSrListDto;
import com.ho.hwang.vo.*;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ho.hwang.vo.AccountVo;


@Repository
@Mapper
public interface UserMapper {
	
	AccountVo selectUser(String id);
	void save(AccountVo account);

	EmployeeVo selectEmployee(int employeeId);
	
	void insertEmployee(InsertEmployeeDto insertEmployeeDto);

	
	//이름으로 아이디값 찾기
	int selectCode(String name);
	int selectDept(String dept_name);


	
	//담당자 이름 찾기
	String selectSE(int id);
	String selectSALES(int id);
	String selectName(String name);
	
	
	
	//모든직원 검색
	List<EmployeeVo> selectAllEmployee(int start);

	List<SelectEmployeeSecuveDto> selectEmployee_secuve();
	
	List<SelectEmployeeOtherDto> selectEmployee_other();
	
	List<String> selectEmployee_type();
	List<String> selectDept_name();
	



	//관리자 페이지
	List<CodeVo> selectCodeList();
	//코드테이블 삭제
	int deleteCode(int codeId);
	//코드테이블 추가
	void insertCode(CodeVo CodeVo);

	
	//직원 삭제
	int deleteEmployee(int employeeId);

	//jqgrid test
	List<EmployeeVo> selectAllEmployee2();

	List<String> selectDepartment();

	int updateEmployee(UpdateEmployeeDto updateEmployeeDto);

	int updateCodeTable(UpdateCodeDto updateCodeDto);
}
