package controller;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;


import model.Comment;
import model.Page;
import model.User;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.bind.annotation.ResponseBody;



import service.UserService;

@Controller

public class UserController {
	@Resource private UserService userService;
	
	// 显示所有用户
		@RequestMapping(value = "showUsers")
		public String test(Model userModel,String nowpage) {
			Page<User> page = new Page<User>();
			int  pageIndex  = Integer.parseInt(nowpage);
			//当前页面
			page.setPageIndex(pageIndex);
			int index = (pageIndex-1)*5;
//			总记录数
			int total = userService.selectUserCount();
			page.setPageNumber(total);
			//总页数
			int pageTotal =total/5;
			if(total%10>0){
				pageTotal+=1;
			}
			page.setPageCount(pageTotal);
			List<User> users = userService.findUserByPage(index);
			page.setList(users);
		    userModel.addAttribute("userPage" , page );
	        return "sysUserDesign";
			
		}
		//删除用户
		@RequestMapping(value="sysUserDel")
		public String sysDel(String userid,String nowpage,HttpSession session){
			long rqid = Long.parseLong(userid);
			if(session.getAttribute("admin")==null||session.getAttribute("admin")==""){
				return "error";
			}else{
				int count = userService.deleteUserById(rqid);
				if(count>0){
					System.out.println("succ:第"+nowpage+"页");
					return "redirect:showUsers.do?nowpage="+nowpage;
				}
				else{
					return "error";
				}
			}
			
			
		}
		//批量删除用户
		@RequestMapping(value="sysUserDelMore")
		public String sysDelMore(@RequestParam(value="uids")Integer[] uids,HttpSession session){
				for(int i=0;i<uids.length;i++){
					System.out.println("ids="+uids[i]);
				}
			if(session.getAttribute("admin")==null||session.getAttribute("admin")==""){
				return "error";
			}else{
				int more = userService.deleteUserByIds(uids);
				if(more > 0){
					System.out.println("succ:"+more);
					return "redirect:showUsers.do?nowpage=1";
				}
				else{
					return "error";
				}
			}
		}
	@RequestMapping(value = "login", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String login(String userid, String userpwd, HttpSession session) {
		System.out.println(userid + ":" + userpwd);
		long userId;
		if (userid.length() != 9 || userid == null || userid == "") {
			return "账号不能为空，账号长度必须为9";
		} else if (userpwd == "" || userpwd == null || userpwd.length() != 7) {
			return "账号不能为空，密码长度必须为9";
		} else {
			userId = Long.parseLong(userid);
			User user = userService.checkLogin(userId, userpwd);
			if (user != null) {
				
				session.setAttribute("userinfo", user);
				System.out.println(session.getAttribute("userinfo"));
				return "succ";
			} else {
				return "error";
			}
		}
	}
	//退出登录
	@RequestMapping(value="quit",produces="application/json;charset=utf-8")
	public String quit(HttpSession session){
		session.invalidate();
		return "index";
	}
	//注册
	@RequestMapping(value="registe",produces = "application/json;charset=utf-8")
	@ResponseBody
	public String registe(String registeid,String registepwd,String registename,HttpSession session){
		long rid;
		System.out.println(registeid+":"+registepwd+","+registename);
		if ( registeid.length() != 9 ||  registeid == null ||  registeid == "") {
			return "iderror";
		} else if (registepwd == "" || registepwd == null || registepwd.length() != 7) {
			return "pwderror";
		}else if(registename==null||registename==" "){
			return "nameerror";
		}else {
			rid = Long.parseLong(registeid);
			User ruser = userService.checkLogin(rid, registepwd);
			if (ruser == null) {
				User regUser = new User();
				regUser.setUserid(rid);
				regUser.setUserpwd(registepwd);
				regUser.setUsername(registename);
				int count = userService.insertUser(regUser);
				if(count>0){
					session.setAttribute("userinfo", regUser);
					return "regsucc";
				}else return "regerror";
			}else{
				return "regerror";
			}
		}
	}
	
}
