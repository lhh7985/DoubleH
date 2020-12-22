package com.ho.hwang.controller;

import com.ho.hwang.dto.Customer.InsertCustomerDto;
import com.ho.hwang.dto.Customer.UpdateCustomerDetailDto;
import com.ho.hwang.dto.ManagerHistory.SelectManagerDto;
import com.ho.hwang.dto.Product.SelectDeliveryDto;
import com.ho.hwang.dto.Product.SelectTotalOsDto;
import com.ho.hwang.dto.Sr.SelectSrDetailDto;
import com.ho.hwang.dto.Sr.SelectSrListDto;
import com.ho.hwang.paging.JqgridResponse;
import com.ho.hwang.proxyService.ProxyCustomer;
import com.ho.hwang.service.*;
import com.ho.hwang.vo.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.NoSuchElementException;

@Controller
@RequiredArgsConstructor
@RequestMapping("/customer/*")
public class CustomerController {

    private final UserService userService;
    private final CustomerService customerService;
    private final SrService srService;
    private final ActivityService activityService;
    private final ProxyCustomer proxyCustomer;

    @GetMapping("/{rowid}/detail")
    public String getDetail(@PathVariable("rowid") int rowid, Model model) {
        CustomerVo customerDetail = customerService.selectCustomerDetail(rowid);
        Map<String, Object> managers = userService.selectEmployee(customerDetail.getEmployeeIdManager(), customerDetail.getEmployeeIdSe(), customerDetail.getEmployeeIdSales());

        model.addAttribute("customer", customerDetail);
        model.addAttribute("managers", managers);

        return "customer/detail";
    }

    @GetMapping("/delivery/{customerId}")
    public String getDelivery(Model model, @PathVariable("customerId") int customerId) {
        List<SelectDeliveryDto> list = customerService.selectDelivery(customerId);
        model.addAttribute("list", list);
        List<SelectTotalOsDto> list2 = customerService.selectOS(customerId);
        model.addAttribute("list2", list2);
        return "customer/delivery";
    }

    @GetMapping("/manager/{customerId}")
    public String getManagerHistory(Model model, @PathVariable("customerId") int customerId) {
        List<SelectManagerDto> list = customerService.selectManager(customerId);
        model.addAttribute("list", list);
        return "customer/manager";
    }

    @GetMapping("/list")
    public String getCustomerList() {
        return "customer/list";
    }

    @GetMapping("/getlist")
    public @ResponseBody
    JqgridResponse getAll() {
        return proxyCustomer.selectCustomerList();
    }

    @GetMapping("/sr/{customerId}")
    public String getSrList(Model model, @PathVariable("customerId") int customerId) {
        List<SelectSrListDto> srList = srService.selectSRList(customerId);
        model.addAttribute("srList", srList);

        return "customer/sr";
    }

    @GetMapping("/{srId}/sr-detail")
    public String getSrDetail(Model model, @PathVariable("srId") int srId) {

        SelectSrDetailDto selectSrDetailDto = srService.selectSRDetail(srId)
                .map((srVo) -> new SelectSrDetailDto(srVo))
                .orElseThrow(() -> new NoSuchElementException());
        model.addAttribute("srvo", selectSrDetailDto);

        List<ActivityVo> activityVo = activityService.selectCustomerActivity(srId);
        model.addAttribute("acvo", activityVo);

        return "customer/sr_detail";
    }

    @GetMapping("/activity/{customerId}")
    public String getCustomerActivity(Model model, @PathVariable("customerId") int customerId) {
        List<SrVo> list = customerService.selectVisit(customerId);
        model.addAttribute("list", list);

        return "customer/activity";
    }

    @GetMapping(value = "/modify")
    public String modifyCustomerDetail() {
        return "customer/modify";
    }

    @PostMapping(value = "/modify")
    public void modifyCustomerDetail(UpdateCustomerDetailDto updateCustomerDetailDto) {
        customerService.updateCustomerDetail(updateCustomerDetailDto);
    }

    @PostMapping("/delete")
    @ResponseBody
    public int deleteCustomer(@RequestParam(value = "id") int customerId) throws Exception {
        int result = customerService.deleteCustomer(customerId);
        return result;
    }

    @GetMapping("/enroll")
    public String enrollCustomer(Model model) {
        return "customer/enroll";
    }

    // 고객사 등록부분
    @PostMapping("/enroll")
    public void enrollCustomer(InsertCustomerDto insertCustomerDto) {
        customerService.insertCustomer(insertCustomerDto);
    }

    @GetMapping("{deliveryId}/os")
    public String getOs(@PathVariable("deliveryId") int deliveryId, Model model) {
        //os DB에서 받아오기
        List<OsVo> osList = customerService.selectOs(deliveryId);
        model.addAttribute("osList", osList);
        return "customer/os";
    }
}
