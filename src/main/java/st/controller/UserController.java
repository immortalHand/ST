package st.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import st.exception.CustomException;
import st.pojo.User;
import st.service.UserService;

@Controller
@RequestMapping("user")
public class UserController{

	@Resource
	private UserService userService;
	
	
	@RequestMapping("all")
	public String showAll(HttpServletRequest request){
		List<User> users = userService.showAll();
		request.setAttribute("users", users);
		return "/shePerson";
	}
	
	@RequestMapping("addUser")
	public String addUser(User user,@RequestParam(value ="header")  MultipartFile multipartFile,HttpServletRequest request) throws CustomException{
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
			user.setImg(imgname);
		}
		user.setType(3);
		int i = userService.addUser(user);
		if(i!=1){
			throw new CustomException("注册失败");
		}
		return "/Login";
	}
	
	@RequestMapping("loginStuno")
	@ResponseBody
	public Object loginStuno(int stuno){
		boolean bool = userService.selectStuno(stuno);
		if(bool){
			return "1";
		}
		return "2";
	}
	
	@RequestMapping("login")
	public String login(User user,HttpServletRequest request,HttpSession session){
		User login = userService.login(user);
		if(login == null){
			request.setAttribute("user", user);
			request.setAttribute("error", "用户名或密码错误");
			return "/Login";
		}
		session.setAttribute("loginUser", login);
		return "redirect:/index.do";
	}
	
	@RequestMapping("dologin")
	public String dologin(HttpServletRequest request){
		request.getSession().invalidate();
		return "/Login";
	}
	
	@RequestMapping("addActive")
	public String addActive(int id,int uid,HttpServletRequest request,Model model) throws CustomException{
		if(uid == 0){
			request.setAttribute("error", "请先登录");
			return "/Login";
		}
		User user = userService.selectActiveByUid(uid);
		if(user == null){
			model.addAttribute("error1", "你还未加入任何社团");
			return "redirect:/index.do";
		}
		if(user.getActiveid()!=null){
			String error = "你已有参加活动";
			model.addAttribute("error", error);
			return "redirect:/index.do";
		}
		user.setActiveid(id);
		userService.updateUser(user);
		String error = "报名成功";
		model.addAttribute("message", error);
		return "redirect:/index.do";
	}
	
	@RequestMapping("hou_shezhanglist")
	public String hou_shezhanglist(HttpServletRequest request,@RequestParam(defaultValue="1")Integer pageIndex){
		PageHelper.startPage(pageIndex, 5);
		List<User> users = userService.showAll();
		PageInfo<User> list = new PageInfo<User>(users);
		request.setAttribute("szList", users);
		request.setAttribute("pageIndex", pageIndex);
		request.setAttribute("pageCount", list.getPages());
		return "hou_shezhanglist";
	}
	
	@RequestMapping("deluser")
	public String deluser(int id){
		userService.deluser(id);
		return "redirect:hou_shezhanglist.do";
	}
	
	@RequestMapping("houshezhangupdate")
	public String houshezhangupdate(int id,HttpServletRequest request){
		User user = userService.selectActiveByUid(id);
		request.setAttribute("user", user);
		return "houshezhangupdate";
	}
	
	@RequestMapping("updateUser")
	public String updateUser(User user){
		User users = userService.selectActiveByUid(user.getId());
		users.setName(user.getName());
		users.setPassword(user.getPassword());
		users.setPhone(user.getPhone());
		users.setStuno(user.getStuno());
		userService.updateUser(users);
		return "redirect:hou_shezhanglist.do";
	}
	
	
	@RequestMapping("hourenshezhang")
	public String hourenshezhang(HttpServletRequest request,@RequestParam(defaultValue="1")Integer pageIndex){
		PageHelper.startPage(pageIndex, 5);
		List<User> users = userService.showAllBy3();
		PageInfo<User> list = new PageInfo<User>(users);
		request.setAttribute("szList", users);
		request.setAttribute("pageIndex", pageIndex);
		request.setAttribute("pageCount", list.getPages());
		return "hourenshezhang";
	}
	
	@RequestMapping("renshez")
	public String renshez(int id){
		User user = userService.selectById(id);
		user.setType(2);
		userService.updateUser(user);
		return "redirect:hou_shezhanglist.do";
	}
	
	@RequestMapping("userall")
	public String userall(HttpServletRequest request,@RequestParam(defaultValue="1")Integer pageIndex){
		PageHelper.startPage(pageIndex, 5);
		List<User> users = userService.selectAll();
		PageInfo<User> list = new PageInfo<User>(users);
		request.setAttribute("szList", users);
		request.setAttribute("pageIndex", pageIndex);
		request.setAttribute("pageCount", list.getPages());
		return "houuserall";
	}
	
	@RequestMapping("userallno")
	public String userallno(HttpServletRequest request,@RequestParam(defaultValue="1")Integer pageIndex){
		PageHelper.startPage(pageIndex, 5);
		List<User> users = userService.selectAllno();
		PageInfo<User> list = new PageInfo<User>(users);
		request.setAttribute("szList", users);
		request.setAttribute("pageIndex", pageIndex);
		request.setAttribute("pageCount", list.getPages());
		return "houuserallno";
	}
}
