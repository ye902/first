package controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import model.Admin;
import model.Comment;
import model.Page;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import service.AdminService;

@Controller
public class AdminController {
	@Resource
	AdminService adminService;

	@RequestMapping(value = "adminLogin")
	public String adminLogin(HttpSession session,
			@RequestParam(value = "adminId") String adminId,
			@RequestParam(value = "adminPwd") String adminPwd) {
		if (adminId != null && adminPwd != null) {
			Admin admin = adminService.loginAdmin(adminPwd, adminId);
			if (admin != null) {
				session.setAttribute("admin", admin);
				return "redirect:showUsers.do?nowpage=1";
			} else {
				return "error";
			}
		} else {
			return "error";
		}
	}

	// 退出登录
	@RequestMapping(value = "adminQuit")
	public String adminQuit(HttpSession session) {
		session.invalidate();
		return "sysManage";
	}

	// 修改密码
	@RequestMapping(value = "updateAdminPwd")
	public String updateAdminPwd(HttpSession session,
			@RequestParam(value = "oldAdminPwd") String oldAdminPwd,
			@RequestParam(value = "adminPwd") String adminPwd,
			@RequestParam(value = "adminPwdSec") String adminPwdSec) {
		Admin admin = (Admin) session.getAttribute("admin");
		String adminId = admin.getAdminId();
		String adPwd = admin.getAdminPwd();
		if (adminPwd != null && adminPwdSec != null
				&& adminPwd.equals(adminPwdSec) && oldAdminPwd.equals(adPwd)) {
			int updateCount = adminService.updatePwdById(adminPwd, adminId);
			if (updateCount > 0) {
				session.invalidate();
				return "sysManage";
			} else {
				return "error";
			}
		}
		return "error";
	}

	// 显示所有评论
	@RequestMapping(value = "sysShowAdmins")
	public String test(Model model, String nowpage) {
		Page<Admin> page = new Page<Admin>();
		int pageIndex = Integer.parseInt(nowpage);
		// 当前页面
		page.setPageIndex(pageIndex);
		int index = (pageIndex - 1) * 5;
		// 总记录数
		int total = adminService.selectAdminCount();
		page.setPageNumber(total);
		// 总页数
		int pageTotal = total / 5;
		if (total % 5 > 0) {
			pageTotal += 1;
		}
		page.setPageCount(pageTotal);
		List<Admin> admins = adminService.findAdminByPage(index);
		page.setList(admins);
		model.addAttribute("adminPage", page);
		return "sysAdminDesign";

	}

	// 删除管理员
	@RequestMapping(value = "sysDelAdmin")
	public String sysDel(String adminId, String nowpage, HttpSession session) {
		Admin adminList = (Admin)session.getAttribute("admin");
		String adId=adminList.getAdminId();
		if(adId.equals(adminId)){
			return "error";
		}else{
			if (session.getAttribute("admin") == null
					|| session.getAttribute("admin") == "") {
				return "error";
			} else {
				int count = adminService.deleteAdminById(adminId);
				if (count > 0) {
					System.out.println("succ:第" + nowpage + "页");
					return "redirect:sysShowAdmins.do?nowpage=" + nowpage;
				} else {
					return "error";
				}
			}
		}
		

	}

	// 批量删除管理员
	@RequestMapping(value = "sysAdminDelMore")
	public String sysDelMore(@RequestParam(value = "adids") String[] adids,
			HttpSession session) {
		Admin adminList = (Admin)session.getAttribute("admin");
		String adId=adminList.getAdminId();
		for (int i = 0; i < adids.length; i++) {
			if(adId.equals(adids[i])){
				return "error";
			}
			System.out.println("ids=" + adids[i]);
		}
		if (session.getAttribute("admin") == null
				|| session.getAttribute("admin") == "") {
			return "error";
		} else {
			
			int more = adminService.deleteAdminByIds(adids);
			if (more > 0) {
				System.out.println("succ:" + more);
				return "redirect:sysShowAdmins.do?nowpage=1";
			} else {
				return null;
			}
		}
	}
	
	//新增管理员
	@RequestMapping(value="insertAdmin")
	public String insertAdmin(HttpSession session,
			@RequestParam(value = "insertAdminId") String insertId,
			@RequestParam(value = "insertAdminPwd") String insertPwd){
		if(session.getAttribute("admin")==null||session.getAttribute("admin")==""){
			return "error";
		}else{
			if(insertId==null&&insertPwd==null||insertId==""&&insertPwd==""){
				return "error";
			}else{
				Admin admin = adminService.loginAdmin(insertId, insertPwd);
				if(admin==null){
					int insertCount = adminService.insertAdmin(insertPwd, insertId);
					if(insertCount>0){
						return "redirect:sysShowAdmins.do?nowpage=1";
					}
					return "error";
				}
				return "error";
			}
			
		}
		
	}

}
