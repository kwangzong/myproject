package com.snl.web.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.snl.service.domain.User;
import com.snl.service.user.UserService;

@Controller
public class UserController {

	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	
	
	public UserController(){
		System.out.println(this.getClass());
	}
	
	
	@RequestMapping("/addUser.do")
	public String addUser(@ModelAttribute("user") User user ) throws Exception{
		
		System.out.println("/addUser.do");
			
		userService.addUser(user);
		
		return "redirect:/";	
	}
	
	@RequestMapping("/getUser.do")
	public String getUser( @RequestParam("id") String id , Model model ) throws Exception {
		
		System.out.println("/getUser.do");
		//Business Logic
		User user = userService.getUser(id);
		// Model �� View ����
		model.addAttribute("user", user);
		
		
		
		return "forward:/user/getUser.jsp";
	}
	
	
	@RequestMapping("/login.do")
	public String login(@ModelAttribute("user") User user , HttpSession session ) throws Exception{
		
		System.out.println("/login.do");
		//Business Logic
		User dbUser=userService.getUser(user.getId());
		
		if(user.getPw().equals(dbUser.getPw())){
			session.setAttribute("user", dbUser);
		}
		
		return "redirect:/index.jsp";
	}
}
