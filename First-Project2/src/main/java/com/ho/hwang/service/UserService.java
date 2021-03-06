package com.ho.hwang.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.ho.hwang.dto.Code.InsertCodeDto;
import com.ho.hwang.dto.Code.UpdateCodeDto;
import com.ho.hwang.dto.Employee.*;
import com.ho.hwang.mappers.CustomerMapper;
import com.ho.hwang.vo.CodeVo;
import com.ho.hwang.vo.DepartmentVo;
import com.ho.hwang.vo.EmployeeVo;
import org.springframework.stereotype.Service;

import com.ho.hwang.vo.AccountVo;
import com.ho.hwang.mappers.UserMapper;



import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserService {
	
	private final UserMapper mapper;
	private final CustomerMapper customerMapper;
	
	public AccountVo selectUser(String id) {
		return mapper.selectUser(id);
	}
	public void save(AccountVo account) {
		mapper.save(account);
	}

	public Map<String, Object> selectEmployee(int managerId, int seId, int salesId) {
		Map<String, Object> managers = new HashMap<>();

		EmployeeVo manager = mapper.selectEmployee(managerId);
		if(manager != null) {
			managers.put("manager", manager);
		}

		EmployeeVo se = mapper.selectEmployee(seId);
		if(se != null) {
			managers.put("se", se);
		}

		EmployeeVo sales = mapper.selectEmployee(salesId);
		if(sales != null) {
			managers.put("sales", sales);
		}
		return managers;
	}
	
	public void insertEmployee(InsertEmployeeDto insertEmployeeDto) {
		insertEmployeeDto.setEmployeeType(mapper.selectCode(insertEmployeeDto.getType()));
		insertEmployeeDto.setDepartmentId(mapper.selectDept(insertEmployeeDto.getDepartmentName()));
		mapper.insertEmployee(insertEmployeeDto);
	}
	
	//이름으로 id값 찾기
	public int selectCode(String name) {
		return mapper.selectCode(name);
	}
	public int selectDept(String dept_name) {
		return mapper.selectDept(dept_name);
	}
	public int selectCustomerID(String name) {
		return customerMapper.selectCustomerID(name);
	}
	public String selectName(String name) {
		return mapper.selectName(name);
	}
	
	
	//담당자 이름 
	public String selectSE(int seId) {
		return mapper.selectSE(seId);
	}
	public String selectSALES(int salesId) {
		return mapper.selectSALES(salesId);
	}

	//모든 직원 검색
	public List<EmployeeVo> selectAllEmployee(int start){
		List<EmployeeVo> employeeList = mapper.selectAllEmployee(start);
		return employeeList;
	}


	//고객사 및 자회사 직원 검색
	public List<SelectEmployeeSecuveDto> selectEmployee_secuve(){
		return mapper.selectEmployee_secuve();
	}
	
	public List<SelectEmployeeOtherDto> selectEmployee_other(){
		return mapper.selectEmployee_other();
	}
	
	public List<String> selectEmployee_type(){
		return mapper.selectEmployee_type();
	}
	
	public List<String> selectDept_name(){
		return mapper.selectDept_name();
	}

	
	
	//관리자 페이지 
	public List<CodeVo> selectCodeList(){
		return mapper.selectCodeList();
	}

	//코드테이블 삭제
	public int deleteCode(int codeId) {
		return mapper.deleteCode(codeId);
	}

	//코드테이블 추가
	//Insert된 레코드의 key 값을 Dto에 set해서 리턴
	public CodeVo insertCode(InsertCodeDto insertCodeDto) {
		CodeVo codeVo = CodeVo.builder()
				.codeGroup(insertCodeDto.getCodeGroup())
				.codeUpper(insertCodeDto.getCodeUpper())
				.codeName(insertCodeDto.getCodeName())
				.codeStatus(insertCodeDto.getCodeStatus())
				.build();

		mapper.insertCode(codeVo);
		return codeVo;
	}


	public int deleteEmployee(int employeeId) {
		return mapper.deleteEmployee(employeeId);
	}

	public List<EmployeeVo> selectAllEmployee2() {
		return mapper.selectAllEmployee2();
	}

	public List<String> selectDepartment(){
		return mapper.selectDepartment();
	}

	public int updateEmployee(UpdateEmployeeDto updateEmployeeDto){
		updateEmployeeDto.setDepartmentId(mapper.selectDept(updateEmployeeDto.getDepartmentName()));
		return mapper.updateEmployee(updateEmployeeDto);
	}

	public int updateCodeTable(UpdateCodeDto updateCodeDto){
		return mapper.updateCodeTable(updateCodeDto);
	}
}
