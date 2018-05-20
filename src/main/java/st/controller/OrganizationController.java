package st.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.pagehelper.PageInfo;

import st.exception.CustomException;
import st.pojo.Organization;
import st.pojo.User;
import st.service.OrganizationService;
import st.service.UserService;

@Controller
@RequestMapping("orga")
public class OrganizationController {
	
	@Resource
	private OrganizationService organizationService;
	
	@Autowired
	@Qualifier("userService")
	private UserService userService;
	
	@RequestMapping("all")
	public String showAll(HttpServletRequest request){
		List<Organization> organizations = organizationService.showAll();
		request.setAttribute("shetuans", organizations);
		return "/sheTuan";
	}
	
	@RequestMapping("sheShen")
	public String sheShe(int id,HttpServletRequest request) throws CustomException{
		if(id == 0){
			request.setAttribute("error", "请先登录");
			return "/Login";
		}
		User user = userService.selectActiveByUid(id);
		if(user == null){
			List<Organization> organizations = organizationService.showAll();
			request.setAttribute("shetuans", organizations);
			User use = userService.selectById(id);
			request.setAttribute("user", use);
			return "/sheShen";
		}
		if(user.getOrganizationid() != 0){
			request.setAttribute("error", "你已有社团");
		}
		List<Organization> organizations = organizationService.showAll();
		request.setAttribute("shetuans", organizations);
		request.setAttribute("user", user);
		return "/sheShen";
	}
	
	@RequestMapping("sheTuanInfol")
	public String sheTuanInfol(HttpServletRequest request,Integer id){
		Organization organization = organizationService.sheTuanInfolById(id);
		List<User> user = userService.selectSheZByTuanId(id);
		request.setAttribute("stinfo", organization);
		request.setAttribute("users", user);
		return "/sheTuanInfol";
	}
	
	@RequestMapping("Regist")
	public String showAllOrg(Model model){
		List<Organization> organizations = organizationService.showAll();
		model.addAttribute("orgas", organizations);
		return "/Regist";
	}
	
	@RequestMapping("addOrgaByUserId")
	public String addOrgaByUserId(HttpServletRequest request,@RequestParam("organizationid") Integer organizationid,Model model) throws CustomException{
		User us = (User) request.getSession().getAttribute("loginUser");
		/*User user = userService.selectActiveByUid(us.getId());
		System.out.println(user);
		user.setOrganizationid(organizationid);*/
		us.setOrganizationid(organizationid);
		userService.updateUser(us);
		String error = "入会成功";
		model.addAttribute("message", error);
		return "redirect:/index.do";
	}
	
	
	@RequestMapping("houshetuanlist")
	public String houshetuanlist(@RequestParam(defaultValue="1") Integer pageIndex,@RequestParam(defaultValue="5")Integer pageCount,HttpServletRequest request){
		List<Organization> list = organizationService.showAllOrganization(pageIndex,pageCount);
		PageInfo<Organization> info = new PageInfo<Organization>(list);
		int pages = info.getPages();
		request.setAttribute("pageindex", pageIndex);
		request.setAttribute("lists", list);
		request.setAttribute("pages", pages);
		return "houshetuanlist";
	}
	
	@RequestMapping("addshetuan")
	public String addshetuan(){
		return "addshetuan";
	}
	
	@RequestMapping("addOrga")
	public String addOrga(Organization org,@RequestParam(value ="imgs")  MultipartFile multipartFile,HttpServletRequest request) throws CustomException{
		if(!multipartFile.isEmpty()){
			String url = request.getSession().getServletContext().getRealPath("upload");
			String name = multipartFile.getOriginalFilename();
			String subname = FilenameUtils.getExtension(name);
			String imgname = UUID.randomUUID()+"."+subname;
			File file = new File(url,imgname);
			try {
				multipartFile.transferTo(file);
			} catch (Exception e) {
				throw new CustomException("图片上传失败,可能太大");
			}
			org.setImg(imgname);
		}
		organizationService.addOrga(org);
		return "redirect:houshetuanlist.do";
	}
	
	@RequestMapping("updateshetuan")
	public String updateshetuan(int id,HttpServletRequest request){
		Organization st = organizationService.sheTuanInfolById(id);
		request.setAttribute("st", st);
		return "updateshetuan";
	}
	
	@RequestMapping("updateOrga")
	public String updateOrga(Organization org){
		organizationService.updateOrga(org);
		return "redirect:houshetuanlist.do";
	}
	
	@RequestMapping("delshetuan")
	public String delshetuan(int id){
		organizationService.delshetuan(id);
		return "redirect:houshetuanlist.do";
	}
}
