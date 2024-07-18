package himedia.photobook.controllers.admin;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import himedia.photobook.services.admin.AdminProductServiceImpl;

@Controller
@RequestMapping({"/admin"})
public class AdminProductController {
	@Autowired
	private AdminProductServiceImpl adminProductService;
	
	@RequestMapping("/product")
	public String product() {
		return "/WEB-INF/views/admin/product/admin_product.jsp";
	}

}
