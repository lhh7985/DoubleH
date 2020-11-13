package com.ho.hwang.mappers;

import java.util.List;

import com.ho.hwang.dto.*;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ho.hwang.account.Account;
import com.ho.hwang.dto.ActivityDTO.InsertActivityDTO;
import com.ho.hwang.dto.ActivityDTO.InsertCustomerActivityDTO;
import com.ho.hwang.dto.ActivityDTO.SelectActivityDTO;
import com.ho.hwang.dto.EmployeeDTO.InsertEmployeeDTO;
import com.ho.hwang.dto.EmployeeDTO.SelectEmployeeOtherDTO;
import com.ho.hwang.dto.EmployeeDTO.SelectEmployeeSecuveDTO;
import com.ho.hwang.vo.ActivityVO;
import com.ho.hwang.vo.CodeVO;
import com.ho.hwang.vo.CustomerListVO;
import com.ho.hwang.vo.CustomerVO;
import com.ho.hwang.vo.DeliveryVO;
import com.ho.hwang.vo.EmployeeVO;
import com.ho.hwang.vo.ManagerHistoryVO;
import com.ho.hwang.vo.ManagerVO;
import com.ho.hwang.vo.OsVO;
import com.ho.hwang.vo.ProductVO;
import com.ho.hwang.vo.SrVO;

@Repository
@Mapper
public interface UserMapper {
	
	Account selectUser(String id);
	void save(Account account);
	

	List<CustomerListVO> selectCustomer();
	List<CustomerDTO.SelectCustomerListDTO> selectCustomerList();
	
	List<ProductDTO.SelectDeliveryDTO> selectDelivery(int co_id);
	
	List<OsVO> selectOS(int co_id);
	List<ProductDTO.SelectTotalOsDTO> selectTotalOS();


	CustomerDTO.SelectCustomerDetail selectCustomerDetail(int co_id);
	EmployeeDTO.SelectEmployeeDTO selectEmployee(int employee_id);
	
	List<ProductDTO.SelectCustomerProductDTO> selectCustomerProduct(int customer_id);
	
	
	
	
	void insertEmployee(InsertEmployeeDTO insertEmployeeDTO);
	void insertSR(SrDTO.InsertSrDTO insertSrDTO);
	
	//이름으로 아이디값 찾기
	int selectCode(String name);
	int selectDept(String dept_name);
	int selectCustomerID(String name);
	int selectProductID(String pname);
	
	//담당자 이름 찾기
	String selectSE(int id);
	String selectSALES(int id);
	String selectName(String name);
	
	
	
	
	List<SelectEmployeeSecuveDTO> selectEmployee_secuve();
	
	List<SelectEmployeeOtherDTO> selectEmployee_other();
	
	List<String> selectEmployee_type();
	List<String> selectDept_name();
	
	
	
	
	void insertCustomer(CustomerDTO.InsertCustomerDTO insertCustomerDTO);
	void insertManagerHistory(ManagerHistoryDTO.UpdateManagerHistoryDTO updateManagerHistoryDTO);
	
	int selectCustomer_id();
	
	void insertAddress(CustomerDTO.InsertCustomerDTO insertCustomerDTO);
	void insertActivity(InsertActivityDTO activityVO);
	
	
	
	List<SrDTO.SelectSrDTO> selectSR();
	List<SrDTO.SelectSrListDTO> selectSRList(int customer_id);
	SrDTO.SelectSrDetailDTO selectSRDetail(int sr_id);


	//고객사 방문내역확인
	List<ActivityDTO.SelectVisitDTO> selectVisit(int customer_id);

	//모든 회사 납품정보 확인
	List<ProductDTO.SelectTotalDeliveryDTO> selectTotalDelivery();
	
	//모든 활동 확인
	List<SelectActivityDTO> selectActivity();
	
	//활동 완료
	void updateComplete(int activity_id);
	String selectComplete(int activity_id);
	
	//각 고객사별 활동 등록 과 검색
	void insertCustomerActivity(InsertCustomerActivityDTO activityVO);
	List<ActivityDTO.SelectCustomerActivityDTO> selectCustomerActivity(int sr_id);
	
	
	//제품 페이지 제품 검색
	List<ProductDTO.SelectProductDTO> selectProduct();
	List<ProductDTO.SelectProductDTO> selectSearchAllProduct();
	void insertDelivery(ProductDTO.InsertDeliveryDTO insertDeliveryDTO);
	int selectDelivery_id();
	void insertOS(ProductDTO.InsertDeliveryDTO insertDeliveryDTO);
	
	
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
	void updateEnddate(ManagerHistoryDTO.UpdateManagerHistoryDTO updateManagerHistoryDTO);
	void updateManager(CustomerDTO.UpdateCustomerDetailDTO updateCustomerDetailDTO);
	void updateSE(CustomerDTO.UpdateCustomerDetailDTO updateCustomerDetailDTO);
	void updateSales(CustomerDTO.UpdateCustomerDetailDTO updateCustomerDetailDTO);
	
	//담당자이력
	List<ManagerVO> selectManager(int customer_id);

}
