package st.controller;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageHelper;

import st.exception.CustomException;
import st.pojo.Active;
import st.pojo.Organization;
import st.pojo.User;
import st.service.ActiveService;
import st.service.OrganizationService;
import st.service.UserService;
import st.service.impl.ActiveServiceImpl;

@Controller
public class indexController{

	@Autowired
	@Qualifier("userService")
	private UserService userService;
	
	@Resource
	private OrganizationService organizationService;
	
	@Resource
	private ActiveService activeServiceImpl;
	
	@RequestMapping("index")
	public String index(HttpServletRequest request,String error,String message,String error1) throws CustomException{
		List<User>  users = userService.showUser();
		List<Organization> organizations = organizationService.showOrganizations();
		PageHelper.startPage(1, 5);
		List<Active> actives = activeServiceImpl.showActive();
		request.setAttribute("users", users);
		request.setAttribute("organizations", organizations);
		request.setAttribute("actives", actives);
		if(error != null){
			request.setAttribute("error", error);
		}
		if(message != null){
			request.setAttribute("message", message);
		}
		if(error1 != null){
			request.setAttribute("error1", error1);
		}
		return "index";
	}
	
	@RequestMapping("houtai")
	public String houtai(){
		return "houtai";
	}

}
