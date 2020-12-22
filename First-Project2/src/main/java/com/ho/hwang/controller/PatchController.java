package com.ho.hwang.controller;

import com.ho.hwang.dto.patch.InsertPatchDto;
import com.ho.hwang.paging.JqgridResponse;
import com.ho.hwang.service.PatchService;
import com.ho.hwang.vo.PackageVo;
import com.ho.hwang.vo.PatchHistoryVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.security.Principal;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/patch/*")
public class PatchController {

    private final PatchService patchService;

    @GetMapping("list")
    public String getPatchListPage(Model model){
        return "patch/list";
    }

    @GetMapping("getlist")
    @ResponseBody
    public JqgridResponse getPatchList() {
        List<PatchHistoryVo> patchList = patchService.selectPatchList();
        JqgridResponse response = new JqgridResponse();
        response.setRows(patchList);
        return response;
    }

    @GetMapping("package")
    public String getPackageListPage(Model model){
        return "patch/package";
    }

    @GetMapping("package/getlist")
    @ResponseBody
    public JqgridResponse getPackageList() {
        List<PackageVo> packageList = patchService.selectPackageList();
        JqgridResponse response = new JqgridResponse();
        response.setRows(packageList);
        return response;
    }

    @GetMapping("enroll")
    public String enrollPatch(){
        return "patch/patchEnroll";
    }

    @PostMapping("enroll")
    @ResponseBody
    public void PatchEnroll(InsertPatchDto insertPatchDto, Principal principal){
        PatchHistoryVo patchHistoryVo = patchService.insertPatch(insertPatchDto, principal);
    }
}
