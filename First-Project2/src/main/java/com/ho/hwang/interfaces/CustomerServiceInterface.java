package com.ho.hwang.interfaces;

import com.ho.hwang.paging.JqgridResponse;
import org.springframework.stereotype.Service;

@Service
public interface CustomerServiceInterface {

    JqgridResponse selectCustomerList();
}
