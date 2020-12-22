package com.ho.hwang.proxyService;


import com.ho.hwang.interfaces.CustomerServiceInterface;
import com.ho.hwang.mappers.CustomerMapper;
import com.ho.hwang.paging.JqgridResponse;
import com.ho.hwang.service.CustomerService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ProxyCustomer implements CustomerServiceInterface {
    CustomerServiceInterface customerServiceInterface;
    private final CustomerMapper customerMapper;

    //Proxy 패턴
    @Override
    public JqgridResponse selectCustomerList() {
        customerServiceInterface = new CustomerService(customerMapper);
        return customerServiceInterface.selectCustomerList();
    }
}
