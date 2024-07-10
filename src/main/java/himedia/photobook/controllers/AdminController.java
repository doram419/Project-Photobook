package himedia.photobook.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping({"/admin"})
public class AdminController {
	@RequestMapping({"/home"})
	public String home() {
		return "/WEB-INF/views/admin/admin-pages.jsp";
	}
	
	@RequestMapping({"/customerManagement", "customerManage", "cm"})
	public String customerManagement() {
		return "/WEB-INF/views/admin/customer-management-page.jsp";
	}
}
