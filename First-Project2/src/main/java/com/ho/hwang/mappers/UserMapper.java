package com.ho.hwang.mappers;

import java.util.List;
import java.util.Optional;

import com.ho.hwang.dto.Activity.*;
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
	

	List<SelectCustomerSearchDto> selectCustomer();
	List<CustomerListVo> selectCustomerList(int start, int cntPerPage);
	
	List<SelectDeliveryDto> selectDelivery(int coId);
	
	List<SelectTotalOsDto> selectOS(int coId);
	List<SelectTotalOsDto> selectTotalOS();


	CustomerVo selectCustomerDetail(int coId);
	EmployeeVo selectEmployee(int employeeId);
	
	List<SelectCustomerProductDto> selectCustomerProduct(int customerId);
	
	
	
	
	void insertEmployee(InsertEmployeeDto insertEmployeeDto);
	void insertSR(InsertSrDto insertSrDto);
	
	//이름으로 아이디값 찾기
	int selectCode(String name);
	int selectDept(String dept_name);
	int selectCustomerID(String name);
	int selectProductID(String pname);
	
	//담당자 이름 찾기
	String selectSE(int id);
	String selectSALES(int id);
	String selectName(String name);
	
	
	
	//모든직원 검색
	List<EmployeeVo> selectAllEmployee(int start, int cntPerPage);

	//리스트 개수
	int selectEmployeeTotalCount();
	int selectCustomerTotalCount();
	int selectSrTotalCount();
	int selectDeliveryTotalCount();
	int selectCodeTotalCount();

	List<SelectEmployeeSecuveDto> selectEmployee_secuve();
	
	List<SelectEmployeeOtherDto> selectEmployee_other();
	
	List<String> selectEmployee_type();
	List<String> selectDept_name();
	
	
	
	
	void insertCustomer(InsertCustomerDto insertCustomerDto);
	void insertManagerHistory(UpdateManagerHistoryDto updateManagerHistoryDto);
	
	int selectCustomer_id();
	
	void insertAddress(InsertCustomerDto insertCustomerDto);
	void insertActivity(ActivityVo activityVo);
	
	
	
	List<SelectSrDto> selectSR(int start, int cntPerPage);
	List<SelectSrListDto> selectSRList(int customerId);
	Optional<SrVo> selectSRDetail(int srId);


	//고객사 방문내역확인
	List<SelectVisitDto> selectVisit(int customerId);

	//모든 회사 납품정보 확인
	List<SelectTotalDeliveryDto> selectTotalDelivery(int start, int cntPerPage);
	
	//모든 활동 확인
	List<SelectActivityDto> selectActivity();
	
	//활동 완료
	void updateComplete(int activityId);
	String selectComplete(int activityId);
	
	//각 고객사별 활동 등록 과 검색
	void insertCustomerActivity(ActivityVo activityVo);
	List<ActivityVo> selectCustomerActivity(int srId);
	
	
	//제품 페이지 제품 검색
	List<SelectProductDto> selectProduct();
	List<SelectProductDto> selectSearchAllProduct(int start, int cntPerPage);
	void insertDelivery(InsertDeliveryDto insertDeliveryDto);
	int selectDelivery_id();
	void insertOS(InsertDeliveryDto insertDeliveryDto);
	
	
	//관리자 페이지
	List<CodeVo> selectCodeList(int start, int cntPerPage);
	//코드테이블 삭제
	int deleteCode(String codeId);
	//코드테이블 추가
	void insertCode(CodeVo CodeVo);
	
	//고객사 리스트 삭제
	int deleteCustomer(String customerId);
	
	//납품정보 삭제
	int deleteDelivery(String deliveryId);
	
	//직원 삭제
	int deleteEmployee(String employeeId);
	
	
	//고객사 정보 수정
	void updateEnddate(UpdateManagerHistoryDto updateManagerHistoryDto);
	void updateManager(UpdateCustomerDetailDto updateCustomerDetailDto);
	void updateSE(UpdateCustomerDetailDto updateCustomerDetailDto);
	void updateSales(UpdateCustomerDetailDto updateCustomerDetailDto);
	
	//담당자이력
	List<SelectManagerDto> selectManager(int customerId);

}
