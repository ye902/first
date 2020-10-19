package dao;
import java.util.List;

import org.apache.ibatis.annotations.Param;


import model.Admin;

public interface AdminMapper {
	
	public Admin loginAdmin(@Param("adminPwd") String adminPwd,@Param("adminId") String adminId);
	public int updatePwdById(@Param("adminPwd") String adminPwd,@Param("adminId") String adminId);
	public List<Admin>findAdminByPage(@Param("start")int index);
	public int selectAdminCount();
	public int deleteAdminById(@Param("adminId")String adminId);
	public int deleteAdminByIds(@Param("adids")String[] adids);
	public int insertAdmin(@Param("adminPwd") String adminPwd,@Param("adminId") String adminId);
}
