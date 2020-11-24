package com.ho.hwang.mappers;

import java.util.List;

import com.ho.hwang.dto.Activity.*;
import com.ho.hwang.dto.Customer.*;
import com.ho.hwang.dto.Employee.*;
import com.ho.hwang.dto.ManagerHistory.SelectManagerDTO;
import com.ho.hwang.dto.ManagerHistory.UpdateManagerHistoryDTO;
import com.ho.hwang.dto.Product.*;
import com.ho.hwang.dto.Sr.InsertSrDTO;
import com.ho.hwang.dto.Sr.SelectSrDTO;
import com.ho.hwang.dto.Sr.SelectSrListDTO;
import com.ho.hwang.vo.*;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ho.hwang.vo.AccountVO;


@Repository
@Mapper
public interface UserMapper {
	
	AccountVO selectUser(String id);
	void save(AccountVO account);
	

	List<SelectCustomerSearchDTO> selectCustomer();
	List<CustomerListVO> selectCustomerList(int start, int cntPerPage);
	
	List<SelectDeliveryDTO> selectDelivery(int coId);
	
	List<SelectTotalOsDTO> selectOS(int coId);
	List<SelectTotalOsDTO> selectTotalOS();


	CustomerVO selectCustomerDetail(int coId);
	EmployeeVO selectEmployee(int employeeId);
	
	List<SelectCustomerProductDTO> selectCustomerProduct(int customerId);
	
	
	
	
	void insertEmployee(InsertEmployeeDTO insertEmployeeDTO);
	void insertSR(InsertSrDTO insertSrDTO);
	
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
	List<EmployeeVO> selectAllEmployee(int start, int cntPerPage);

	//리스트 개수
	int selectEmployeeTotalCount();
	int selectCustomerTotalCount();
	int selectSrTotalCount();
	int selectDeliveryTotalCount();
	int selectCodeTotalCount();

	List<SelectEmployeeSecuveDTO> selectEmployee_secuve();
	
	List<SelectEmployeeOtherDTO> selectEmployee_other();
	
	List<String> selectEmployee_type();
	List<String> selectDept_name();
	
	
	
	
	void insertCustomer(InsertCustomerDTO insertCustomerDTO);
	void insertManagerHistory(UpdateManagerHistoryDTO updateManagerHistoryDTO);
	
	int selectCustomer_id();
	
	void insertAddress(InsertCustomerDTO insertCustomerDTO);
	void insertActivity(InsertActivityDTO insertActivityDTO);
	
	
	
	List<SelectSrDTO> selectSR(int start, int cntPerPage);
	List<SelectSrListDTO> selectSRList(int customerId);
	SrVO selectSRDetail(int srId);


	//고객사 방문내역확인
	List<SelectVisitDTO> selectVisit(int customerId);

	//모든 회사 납품정보 확인
	List<SelectTotalDeliveryDTO> selectTotalDelivery(int start, int cntPerPage);
	
	//모든 활동 확인
	List<SelectActivityDTO> selectActivity();
	
	//활동 완료
	void updateComplete(int activityId);
	String selectComplete(int activityId);
	
	//각 고객사별 활동 등록 과 검색
	void insertCustomerActivity(InsertCustomerActivityDTO insertCustomerActivityDTO);
	List<SelectCustomerActivityDTO> selectCustomerActivity(int srId);
	
	
	//제품 페이지 제품 검색
	List<SelectProductDTO> selectProduct();
	List<SelectProductDTO> selectSearchAllProduct(int start, int cntPerPage);
	void insertDelivery(InsertDeliveryDTO insertDeliveryDTO);
	int selectDelivery_id();
	void insertOS(InsertDeliveryDTO insertDeliveryDTO);
	
	
	//관리자 페이지
	List<CodeVO> selectCodeList(int start, int cntPerPage);
	//코드테이블 삭제
	int deleteCode(String codeId);
	//코드테이블 추가
	void insertCode(CodeVO CodeVO);
	
	//고객사 리스트 삭제
	int deleteCustomer(String customerId);
	
	//납품정보 삭제
	int deleteDelivery(String deliveryId);
	
	//직원 삭제
	int deleteEmployee(String employeeId);
	
	
	//고객사 정보 수정
	void updateEnddate(UpdateManagerHistoryDTO updateManagerHistoryDTO);
	void updateManager(UpdateCustomerDetailDTO updateCustomerDetailDTO);
	void updateSE(UpdateCustomerDetailDTO updateCustomerDetailDTO);
	void updateSales(UpdateCustomerDetailDTO updateCustomerDetailDTO);
	
	//담당자이력
	List<SelectManagerDTO> selectManager(int customerId);

}
