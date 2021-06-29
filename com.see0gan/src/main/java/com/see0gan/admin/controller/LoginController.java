package com.see0gan.admin.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.see0gan.admin.vo.LoginVO;



@Controller
@RequestMapping(value = "/admin")
public class LoginController {
	
	   @RequestMapping(value="/login", method=RequestMethod.GET)
	    public ModelAndView loginForm(LoginVO loginCommand,
	                    @CookieValue(value="REMEMBER", required=false) Cookie rememberCookie) throws Exception {
		   System.out.println("ModelAndView login GET 진입!!!!");
	        if(rememberCookie!=null) {
	            loginCommand.setId(rememberCookie.getValue());
	            loginCommand.setRememberId(true);
	        }
	       
	        ModelAndView mv = new ModelAndView("admin/loginForm");
	        return mv;
	    }
	   
	   @RequestMapping(value = "/login", method = RequestMethod.POST)
	    public String Login(Model model,HttpSession session
	    					,@RequestParam("id") String id
	                       , @RequestParam("pwd") String pwd ,LoginVO loginCommand, HttpServletResponse response){

	        String path = "";
	        loginCommand.setId(id);
	        loginCommand.setPw(pwd);	        

	        int result = 0;
	        System.out.println("ModelAndView login POST 진입!!!!");
	        if( loginCommand.getId().equals("admin") == true 
	        	&& loginCommand.getPw().equals("1234") == true)
	        {
	        	result = 1;
	        }
	         	 	
				Cookie rememberCookie = new Cookie("REMEMBER", loginCommand.getId());
				rememberCookie.setPath("/");
				
		        if(result == 1) {
		        	 System.out.println("controller Login //result == 1");
		            path = "admin/mainForm";
		            session.setAttribute("loginCheck", true);
		            session.setAttribute("loginID", loginCommand.getId());
		            
		            if(loginCommand.isRememberId()) {
		            	System.out.println("loginCommand.isRememberId()");
		                rememberCookie.setMaxAge(60*60*24*7);
		            } else {
		            	System.out.println("else///////////////loginCommand.isRememberId()");
		                rememberCookie.setMaxAge(0);
		            }
		            response.addCookie(rememberCookie);
	             
	            } else {
	                rememberCookie.setMaxAge(0);
	                System.out.println("controller Login //result else ");
	                model.addAttribute("msg", "암호가 일치하지 않습니다."); 
	               

	                path = "admin/loginForm";
	            }
		    

	        return path;

	    }

}
