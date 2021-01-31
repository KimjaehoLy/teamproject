package erp;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import erp.model.LoginVO;

@Controller
public class ErpLMController {

	@RequestMapping("/fioerp")
	String mainview() {
		return "mainLayout"; 
	}
	@RequestMapping("/login/main")
	String loginview() {
		return "loginMain"; 
	}
	@RequestMapping("/login/reg")
	String loginreg() {
		return "redirect:/fioerp"; 
	}
	
	@Resource
	EventcalenderMapper mapper;
	
	@RequestMapping("/caldata")
	String caltest(HttpServletRequest req) {
		req.setAttribute("calendata", mapper.list());
		return "calData";
	}
	@RequestMapping("/fultest")
	String fultest() {
		return "fultest";
	}
	@RequestMapping("/logout")
	String logout(HttpServletRequest req) throws Exception{
		
		req.getSession().invalidate();
		
		return "redirect:/login/main"; 
	}

	
	
	
}
