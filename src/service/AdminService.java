package service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import model.Admin;
import model.User;

public interface AdminService {
	public Admin loginAdmin(String adminPwd,String adminId);
	public int updatePwdById(String adminPwd,String adminId);
	public List<Admin>findAdminByPage(int index);
	public int selectAdminCount();
	public int deleteAdminById(String adminId);
	public int deleteAdminByIds(String[] adids);
	public int insertAdmin(String adminPwd,String adminId);
}
