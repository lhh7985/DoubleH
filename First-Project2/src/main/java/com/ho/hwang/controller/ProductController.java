package com.ho.hwang.controller;

import java.util.List;

import com.ho.hwang.dto.Product.InsertDeliveryDto;
import com.ho.hwang.dto.Product.SelectProductDto;
import com.ho.hwang.dto.Product.SelectTotalDeliveryDto;
import com.ho.hwang.dto.Product.SelectTotalOsDto;
import com.ho.hwang.paging.Page;
import com.ho.hwang.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/product/*")
public class ProductController {

	private final ProductService productService;

	@GetMapping("/list")
	public String getProductList(Model model) {

		List<SelectProductDto> productList = productService.selectProduct();
		model.addAttribute("productList", productList);

		return "product/list";
	}

	// 납품정보
	@GetMapping("/delivery")
	public String getDeliveryList(@RequestParam(defaultValue = "1") int page, Model model) {

		int listCnt = productService.selectDeliveryTotalCount();
		Page paging = new Page(listCnt, page);

		List<SelectTotalDeliveryDto> deliveryList = productService.selectTotalDelivery(paging.getStartIndex(), paging.getPageSize());
		model.addAttribute("deliveryList", deliveryList);
		List<SelectTotalOsDto> osList = productService.selectTotalOS();
		model.addAttribute("osList", osList);
		model.addAttribute("paging", paging);

		return "product/delivery";
	}

	@GetMapping("/delivery/enroll")
	public String enrollDelivery(Model model) {
		return "product/delivery_enroll";
	}

	@PostMapping("/delivery/enroll")
	public void enrollDelivery(InsertDeliveryDto insertDeliveryDto) {
		productService.insertDelivery(insertDeliveryDto);
	}

	@PostMapping("/delivery/delete")
	@ResponseBody
	public int deleteDelivery(@RequestParam(value = "chbox[]") List<Integer> charr) throws Exception {
		int result = productService.deleteDelivery(charr);
		return result;
	}
}
