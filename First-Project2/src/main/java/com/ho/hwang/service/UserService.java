package com.ho.hwang.service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collector;
import java.util.stream.Collectors;

import com.ho.hwang.dto.Code.CodeDTO;
import com.ho.hwang.dto.Code.InsertCodeDTO;
import com.ho.hwang.dto.Employee.*;
import org.springframework.stereotype.Service;

import com.ho.hwang.account.Account;
import com.ho.hwang.mappers.UserMapper;



import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserService {
	
	private final UserMapper mapper;
	
	public Account selectUser(String id) {
		return mapper.selectUser(id);
	}
	public void save(Account account) {
		mapper.save(account);
	}

	public SelectEmployeeDTO selectEmployee(int employee_id) {
		return mapper.selectEmployee(employee_id);
	}
	
	public void insertEmployee(InsertEmployeeDTO insertEmployeeDTO) {
		insertEmployeeDTO.setEmployee_type(mapper.selectCode(insertEmployeeDTO.getType()));
		insertEmployeeDTO.setDepartment_id(mapper.selectDept(insertEmployeeDTO.getDept()));
		mapper.insertEmployee(insertEmployeeDTO);
	}
	
	//이름으로 id값 찾기
	public int selectCode(String name) {
		return mapper.selectCode(name);
	}
	public int selectDept(String dept_name) {
		return mapper.selectDept(dept_name);
	}
	public int selectCustomerID(String name) {
		return mapper.selectCustomerID(name);
	}
	public String selectName(String name) {
		return mapper.selectName(name);
	}
	
	
	//담당자 이름 
	public String selectSE(int id) {
		return mapper.selectSE(id);
	}
	public String selectSALES(int id) {
		return mapper.selectSALES(id);
	}
	
	//고객사 및 자회사 직원 검색
	public List<SelectEmployeeSecuveDTO> selectEmployee_secuve(){
		return mapper.selectEmployee_secuve();
	}
	
	public List<SelectEmployeeOtherDTO> selectEmployee_other(){
		return mapper.selectEmployee_other();
	}
	
	public List<String> selectEmployee_type(){
		return mapper.selectEmployee_type();
	}
	
	public List<String> selectDept_name(){
		return mapper.selectDept_name();
	}

	//모든회사 납품정보 확인

	
	//제품페이지 제품 검색

	
	
	//관리자 페이지 
	public List<CodeDTO> selectCodeList(){
		return mapper.selectCodeList();
	}
	//코드테이블 삭제
	public int deleteCode(List<Integer> charr) {
		int result = 0;

		Optional<List<Integer>> op = Optional.ofNullable(charr);
		if(op.isPresent()) {
			String code_id = charr.stream()
					.map(n -> n.toString())
					.collect(Collectors.joining(","));

			mapper.deleteCode(code_id);
			result = 1;
		}
		return result;

	}
	//코드테이블 추가
	public void insertCode(InsertCodeDTO insertCodeDTO) {
		mapper.insertCode(insertCodeDTO);
	}



	//직원 삭제
	public int deleteEmployee(List<Integer> charr) {
		int result=0;

		Optional<List<Integer>> op = Optional.ofNullable(charr);
		if(op.isPresent()){
			String employee_id = charr.stream()
					.map(n->n.toString())
					.collect(Collectors.joining(","));

			mapper.deleteCode(employee_id);
			result = 1;
		}
		return result;
	}

}
