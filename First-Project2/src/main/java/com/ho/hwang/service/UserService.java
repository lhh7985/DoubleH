package com.ho.hwang.service;

import java.util.List;
import java.util.stream.Collectors;

import com.ho.hwang.dto.Code.InsertCodeDTO;
import com.ho.hwang.dto.Employee.*;
import com.ho.hwang.vo.CodeVO;
import com.ho.hwang.vo.EmployeeVO;
import org.springframework.stereotype.Service;

import com.ho.hwang.vo.AccountVO;
import com.ho.hwang.mappers.UserMapper;



import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserService {
	
	private final UserMapper mapper;
	
	public AccountVO selectUser(String id) {
		return mapper.selectUser(id);
	}
	public void save(AccountVO account) {
		mapper.save(account);
	}

	public EmployeeVO selectEmployee(int employeeId) {
		return mapper.selectEmployee(employeeId);
	}
	
	public void insertEmployee(InsertEmployeeDTO insertEmployeeDTO) {
		insertEmployeeDTO.setEmployeeType(mapper.selectCode(insertEmployeeDTO.getType()));
		insertEmployeeDTO.setDepartmentId(mapper.selectDept(insertEmployeeDTO.getDept()));
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
	public String selectSE(int seId) {
		return mapper.selectSE(seId);
	}
	public String selectSALES(int salesId) {
		return mapper.selectSALES(salesId);
	}

	//모든 직원 검색
	public List<EmployeeVO> selectAllEmployee(int start, int cntPerPage){
		List<EmployeeVO> employeeList = mapper.selectAllEmployee(start, cntPerPage);
		return employeeList;
	}

	//리스트 개수
	public int selectEmployeeTotalCount() {
		return mapper.selectEmployeeTotalCount();
	}
	public int selectCodeTotalCount(){
		return mapper.selectCodeTotalCount();
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

	
	
	//관리자 페이지 
	public List<CodeVO> selectCodeList(int start, int cntPerPage){
		return mapper.selectCodeList(start, cntPerPage);
	}

	//코드테이블 삭제
	public int deleteCode(List<Integer> checkList) {
		String deleteList = checkList.stream().map(n->n.toString()).collect(Collectors.joining(","));
		return mapper.deleteCode(deleteList);
	}

	//코드테이블 추가
	//Insert된 레코드의 key 값을 DTO에 set해서 리턴
	public CodeVO insertCode(InsertCodeDTO insertCodeDTO) {
		CodeVO codeVO = CodeVO.builder()
				.codeGroup(insertCodeDTO.getCodeGroup())
				.codeUpper(insertCodeDTO.getCodeUpper())
				.codeName(insertCodeDTO.getCodeName())
				.codeStatus(insertCodeDTO.getCodeStatus())
				.build();

		mapper.insertCode(codeVO);
		return codeVO;
	}

	//직원 삭제
	public int deleteEmployee(List<Integer> checkList) {
		String deleteList = checkList.stream().map(n -> n.toString()).collect(Collectors.joining(","));
		return mapper.deleteEmployee(deleteList);
	}

}
