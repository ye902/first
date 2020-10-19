package service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.AdminMapper;

import model.Admin;
import service.AdminService;
@Service("AdminService")
@Transactional
public class AdminServiceImpl implements AdminService {
	@Resource private AdminMapper adminMapper;
	@Override
	public Admin loginAdmin(String adminPwd, String adminId) {
		// TODO Auto-generated method stub
		return adminMapper.loginAdmin(adminPwd, adminId);
	}

	@Override
	public int updatePwdById(String adminPwd, String adminId) {
		// TODO Auto-generated method stub
		return adminMapper.updatePwdById(adminPwd, adminId);
	}

	@Override
	public List<Admin> findAdminByPage(int index) {
		// TODO Auto-generated method stub
		return adminMapper.findAdminByPage(index);
	}

	@Override
	public int selectAdminCount() {
		// TODO Auto-generated method stub
		return adminMapper.selectAdminCount();
	}

	@Override
	public int deleteAdminById(String adminId) {
		// TODO Auto-generated method stub
		return adminMapper.deleteAdminById(adminId);
	}

	@Override
	public int deleteAdminByIds(String[] adids) {
		// TODO Auto-generated method stub
		return adminMapper.deleteAdminByIds(adids);
	}

	@Override
	public int insertAdmin(String adminPwd, String adminId) {
		// TODO Auto-generated method stub
		return adminMapper.insertAdmin(adminPwd, adminId);
	}

}
