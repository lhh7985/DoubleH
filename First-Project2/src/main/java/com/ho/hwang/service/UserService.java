package com.ho.hwang.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ho.hwang.account.Account;
import com.ho.hwang.mappers.UserMapper;
import com.ho.hwang.vo.ActivityVO;
import com.ho.hwang.vo.CodeVO;
import com.ho.hwang.vo.CustomerListVO;
import com.ho.hwang.vo.CustomerVO;
import com.ho.hwang.vo.DeliveryVO;
import com.ho.hwang.vo.EmployeeVO;
import com.ho.hwang.vo.OsVO;
import com.ho.hwang.vo.ProductVO;
import com.ho.hwang.vo.SrVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserService {
	
	private final UserMapper mapper;
	
	
	
//	@Autowired
//	public UserMapper mapper;
	
	public Account selectUser(String id) {
		return mapper.selectUser(id);
	}
	public void save(Account account) {
		mapper.save(account);
	}
	
	
	public List<CustomerListVO> selectCustomer(){
		return mapper.selectCustomer();
	}
	public List<CustomerListVO> selectCustomerList(){
		return mapper.selectCustomerList();
	}
	
	
	public List<DeliveryVO> selectDelivery(int co_id){
		return mapper.selectDelivery(co_id);
	}
	
	public List<OsVO> selectOS(int co_id){
		return mapper.selectOS(co_id);
	}
	public List<OsVO> selectTotalOS(){
		return mapper.selectTotalOS();
	}
	
	
	public CustomerVO selectCustomerDetail(int co_id) {
		return mapper.selectCustomerDetail(co_id);
	}
	public EmployeeVO selectEmployee(int employee_id) {
		return mapper.selectEmployee(employee_id);
	}
	public List<DeliveryVO> selectCustomerProduct(int customer_id) {
		return mapper.selectCustomerProduct(customer_id);
	}
	
	
	
	public void insertEmployee(EmployeeVO employeeVO) {
		mapper.insertEmployee(employeeVO);
	}
	public void insertSR(SrVO srVO) {
		mapper.insertSR(srVO);
	}
	public void insertActivity(ActivityVO activityVO) {
		mapper.insertActivity(activityVO);
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
	public int selectProductID(String pname) {
		return mapper.selectProductID(pname);
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
	
	
	
	public List<EmployeeVO> selectEmployee_secuve(){
		return mapper.selectEmployee_secuve();
	}
	
	public List<EmployeeVO> selectEmployee_other(){
		return mapper.selectEmployee_other();
	}
	
	public List<String> selectEmployee_type(){
		return mapper.selectEmployee_type();
	}
	
	public List<String> selectDept_name(){
		return mapper.selectDept_name();
	}
	
	public void insertCustomer(CustomerVO customerVO) {
		mapper.insertCustomer(customerVO);
	}
	
	public int selectCustomer_id() {
		return mapper.selectCustomer_id();
	}
	
	public void insertAddress(CustomerVO customerVO) {
		mapper.insertAddress(customerVO);
	}
	
	
	//SR 리스트 확인
	public List<SrVO> selectSR(){
		return mapper.selectSR();
	}
	//각 고객사의 sr확인
	public List<SrVO> selectSRList(int customer_id){
		return mapper.selectSRList(customer_id);
	}
	//SR 내용확인
	public SrVO selectSRDetail(int sr_id) {
		return mapper.selectSRDetail(sr_id);
	}
	
	//고객사 방문내역 확인
	public List<ActivityVO> selectVisit(int customer_id){
		return mapper.selectVisit(customer_id);
	}
	
	//모든회사 납품정보 확인
	public List<DeliveryVO> selectTotalDelivery(){
		return mapper.selectTotalDelivery();
	}
	
	//모든 활동 확인
	public List<ActivityVO> selectActivity(){
		return mapper.selectActivity();
	}
	
	//활동완료
	public void updateComplete(int activity_id) {
		String status = mapper.selectComplete(activity_id);
		if(status !="완료")
			mapper.updateComplete(activity_id);
		
	}
	
	
	//각 고객별 활동 등록 및 검색
	public void insertCustomerActivity(ActivityVO activityVO) {
		mapper.insertCustomerActivity(activityVO);
	}
	public List<ActivityVO> selectCustomerActivity(int sr_id){
		return mapper.selectCustomerActivity(sr_id);
	}
	
	
	//제품페이지 제품 검색
	public List<ProductVO> selectProduct(){
		return mapper.selectProduct();
	}
	public List<ProductVO> selectSearchProduct2(){
		return mapper.selectSearchProduct2();
	}
	public void insertDelivery(DeliveryVO deliveryVO) {
		mapper.insertDelivery(deliveryVO);
	}
	public int selectLast() {
		return mapper.selectLast();
	}
	public void insertOS(OsVO osvo) {
		mapper.insertOS(osvo);
	}
	
	
	//관리자 페이지 
	public List<CodeVO> selectCodeList(){
		return mapper.selectCodeList();
	}
	//코드테이블 삭제
	public void deleteCode(int code_id) {
		mapper.deleteCode(code_id);
	}
	//코드테이블 추가
	public void insertCode(CodeVO codevo) {
		mapper.insertCode(codevo);
	}
	
	
	
	//고객 목록 삭제
	public void deleteCustomer(int customer_id) {
		mapper.deleteCustomer(customer_id);
	}
	//납품정보 삭제
	public void deleteDelivery(int delivery_id) {
		mapper.deleteDelivery(delivery_id);
	}
	//직원 삭제
	public void deleteEmployee(int employee_id) {
		mapper.deleteEmployee(employee_id);
	}
}
