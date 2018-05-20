package st.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import st.exception.CustomException;
import st.pojo.Active;
import st.pojo.Organization;
import st.pojo.User;
import st.service.ActiveService;
import st.service.OrganizationService;

@Controller
@RequestMapping("active")
public class ActiveController {

	@Resource
	private ActiveService activeService;
	
	@Autowired
	private OrganizationService organizationService;
	
	@RequestMapping("all")
	public String showAll(HttpServletRequest request){
		List<Active> list = activeService.showActive();
		request.setAttribute("actives", list);
		return "/sheActive";
	}
	
	@RequestMapping("ActiveInfo")
	public String ActiveInfo(int id,HttpServletRequest request){
		Active active = activeService.selectActiveById(id);
		request.setAttribute("active", active);
		return "/ActiveInfo";
	}
	
	@RequestMapping("selectActivesByOrgaId")
	public String selectActivesByOrgaId(int id,HttpServletRequest request){
		List<Active> actives = activeService.selectActivesByOrgaId(id);
		request.setAttribute("actives", actives);
		return "/sheActive";
	}
	
	@RequestMapping("houactivelist")
	public String houactivelist(HttpServletRequest request,@RequestParam(defaultValue="1")Integer pageIndex){
		PageHelper.startPage(pageIndex, 5);
		List<Active> lists = activeService.selectAll();
		request.setAttribute("hdList", lists);
		PageInfo<Active> list = new PageInfo<Active>(lists);
		request.setAttribute("pageIndex", pageIndex);
		request.setAttribute("pageCount", list.getPages());
		return "houactivelist";
	}
	
	@RequestMapping("delactive")
	public String delactive(int id){
		activeService.delactive(id);
		return "redirect:houactivelist.do";
	}
	
	@RequestMapping("houshowadd")
	public String houshowadd(HttpServletRequest request){
		List<Organization> organizations = organizationService.showAll();
		request.setAttribute("orgas", organizations);
		return "addactive";
	}
	
	@RequestMapping("addactive")
	public String addactive(Active active,@RequestParam(value ="imgs")  MultipartFile multipartFile,HttpServletRequest request) throws CustomException{
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
			active.setImg(imgname);
		}
		activeService.addactive(active);
		return "redirect:houactivelist.do";
	}
}
