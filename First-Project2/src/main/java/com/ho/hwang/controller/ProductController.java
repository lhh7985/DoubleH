package com.ho.hwang.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ho.hwang.service.UserService;
import com.ho.hwang.vo.DeliveryVO;
import com.ho.hwang.vo.OsVO;
import com.ho.hwang.vo.ProductVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/product")
public class ProductController {

	private final UserService userService;

	@GetMapping("/list")
	public String getProductList(Model model) {
		List<ProductVO> productList = userService.selectProduct();
		model.addAttribute("productList", productList);

		return "product/list";
	}

	// 납품정보
	@GetMapping("/delivery")
	public String getDeliveryList(Model model) {
		List<DeliveryVO> deliveryList = userService.selectTotalDelivery();
		model.addAttribute("deliveryList", deliveryList);
		List<OsVO> osList = userService.selectTotalOS();
		model.addAttribute("osList", osList);

		return "product/delivery";
	}

	@GetMapping("/delivery/enroll")
	public String enrollDelivery(Model model) {
		return "product/delivery_enroll";
	}

	@PostMapping(value = "/delivery/enroll")
	public String enrollDelivery(DeliveryVO deliveryVO) {
		userService.insertDelivery(deliveryVO);
		int delivery_id = userService.selectLast();
		OsVO osvo = new OsVO();
		// window 입력
		if (deliveryVO.getWindow() != 0) {
			osvo.setDelivery_id(delivery_id);
			osvo.setOs_name("Window");
			osvo.setOs_quantity(deliveryVO.getWindow());
			userService.insertOS(osvo);
		}
		// Linux 입력
		if (deliveryVO.getLinux() != 0) {
			osvo.setDelivery_id(delivery_id);
			osvo.setOs_name("Linux");
			osvo.setOs_quantity(deliveryVO.getLinux());
			userService.insertOS(osvo);
		}
		// Unix 입력
		if (deliveryVO.getUnix() != 0) {
			osvo.setDelivery_id(delivery_id);
			osvo.setOs_name("Unix");
			osvo.setOs_quantity(deliveryVO.getUnix());
			userService.insertOS(osvo);
		}
		return "product/delivery";
	}

	@PostMapping("/delivery/delete")
	@ResponseBody
	public int deleteDelivery(@RequestParam(value = "chbox[]") List<Integer> charr) throws Exception {
		int result = 0;
		if (charr != null) {
			for (int i : charr) {
				userService.deleteDelivery(i);
			}
			result = 1;
		}
		return result;
	}
}
