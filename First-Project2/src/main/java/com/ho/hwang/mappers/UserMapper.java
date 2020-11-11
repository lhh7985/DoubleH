package com.ho.hwang.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ho.hwang.account.Account;
import com.ho.hwang.vo.ActivityVO;
import com.ho.hwang.vo.CodeVO;
import com.ho.hwang.vo.CustomerListVO;
import com.ho.hwang.vo.CustomerVO;
import com.ho.hwang.vo.DeliveryVO;
import com.ho.hwang.vo.EmployeeVO;
import com.ho.hwang.vo.OsVO;
import com.ho.hwang.vo.ProductVO;
import com.ho.hwang.vo.SrVO;

@Repository
@Mapper
public interface UserMapper {
	
	Account selectUser(String id);
	void save(Account account);
	

	List<CustomerListVO> selectCustomer();
	List<CustomerListVO> selectCustomerList();
	
	List<DeliveryVO> selectDelivery(int co_id);
	
	List<OsVO> selectOS(int co_id);
	List<OsVO> selectTotalOS();
	
	
	CustomerVO selectCustomerDetail(int co_id);
	EmployeeVO selectEmployee(int employee_id);
	
	List<DeliveryVO> selectCustomerProduct(int customer_id);
	
	
	
	
	void insertEmployee(EmployeeVO employeeVO);
	void insertSR(SrVO srVO);
	
	//이름으로 아이디값 찾기
	int selectCode(String name);
	int selectDept(String dept_name);
	int selectCustomerID(String name);
	int selectProductID(String pname);
	
	//담당자 이름 찾기
	String selectSE(int id);
	String selectSALES(int id);
	String selectName(String name);
	
	
	
	
	List<EmployeeVO> selectEmployee_secuve();
	
	List<EmployeeVO> selectEmployee_other();
	
	List<String> selectEmployee_type();
	List<String> selectDept_name();
	
	
	
	
	void insertCustomer(CustomerVO customerVO);
	
	int selectCustomer_id();
	
	void insertAddress(CustomerVO customerVO);
	void insertActivity(ActivityVO activityVO);
	
	
	
	List<SrVO> selectSR();
	List<SrVO> selectSRList(int customer_id);
	SrVO selectSRDetail(int sr_id);
	
	
	//고객사 방문내역확인
	List<ActivityVO> selectVisit(int customer_id);
	
	//모든 회사 납품정보 확인
	List<DeliveryVO> selectTotalDelivery();
	
	//모든 활동 확인
	List<ActivityVO> selectActivity();
	
	//활동 완료
	void updateComplete(int activity_id);
	String selectComplete(int activity_id);
	
	//각 고객사별 활동 등록 과 검색
	void insertCustomerActivity(ActivityVO activityVO);
	List<ActivityVO> selectCustomerActivity(int sr_id);
	
	
	//제품 페이지 제품 검색
	List<ProductVO> selectProduct();
	List<ProductVO> selectSearchProduct2();
	void insertDelivery(DeliveryVO deliveryVO);
	int selectLast();
	void insertOS(OsVO osvo);
	
	
	//관리자 페이지
	List<CodeVO> selectCodeList();
	//코드테이블 삭제
	void deleteCode(int code_id);
	//코드테이블 추가
	void insertCode(CodeVO codevo);
	
	//고객사 리스트 삭제
	void deleteCustomer(int customer_id);
	
	//납품정보 삭제
	void deleteDelivery(int delivery_id);
	
	//직원 삭제
	void deleteEmployee(int employee_id);
	
	
	//고객사 정보 수정
	void updateManaer(CustomerVO customerVO);
	void updateSE(CustomerVO customerVO);
	void updateSales(CustomerVO customerVO);

}
