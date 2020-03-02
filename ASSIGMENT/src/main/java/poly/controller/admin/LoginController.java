package poly.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {

	@RequestMapping("/trang-dang-nhap")
	public String login() {
		
		return "blank/login-form";
	}
	
	
	
}
