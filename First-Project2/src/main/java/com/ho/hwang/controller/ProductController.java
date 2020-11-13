package com.ho.hwang.controller;

import java.util.List;

import com.ho.hwang.dto.ProductDTO;
import com.ho.hwang.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ho.hwang.service.UserService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/product/*")
public class ProductController {

	private final ProductService productService;

	@GetMapping("/list")
	public String getProductList(Model model) {
		List<ProductDTO.SelectProductDTO> productList = productService.selectProduct();
		model.addAttribute("productList", productList);

		return "product/list";
	}

	// 납품정보
	@GetMapping("/delivery")
	public String getDeliveryList(Model model) {
		List<ProductDTO.SelectTotalDeliveryDTO> deliveryList = productService.selectTotalDelivery();
		model.addAttribute("deliveryList", deliveryList);
		List<ProductDTO.SelectTotalOsDTO> osList = productService.selectTotalOS();
		model.addAttribute("osList", osList);

		return "product/delivery";
	}

	@GetMapping("/delivery/enroll")
	public String enrollDelivery(Model model) {
		return "product/delivery_enroll";
	}

	@PostMapping("/delivery/enroll")
	public void enrollDelivery(ProductDTO.InsertDeliveryDTO insertDeliveryDTO) {
		productService.insertDelivery(insertDeliveryDTO);
	}

	@PostMapping("/delivery/delete")
	@ResponseBody
	public int deleteDelivery(@RequestParam(value = "chbox[]") List<Integer> charr) throws Exception {
		int result = productService.deleteDelivery(charr);
		return result;
	}
}
