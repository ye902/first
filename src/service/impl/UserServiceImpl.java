package service.impl;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import service.UserService;

import dao.UserMapper;

import model.User;
@Service("UserService")
@Transactional
public class UserServiceImpl implements UserService {
	@Resource private UserMapper userMapper;
	@Override
	public int insertUser(User user) {
		// TODO Auto-generated method stub
		return userMapper.insertUser(user);
	}
	@Override
	public User updatePwdById(User user) {
		// TODO Auto-generated method stub
		return userMapper.updatePwdById(user);
	}

	@Override
	public User checkLogin(long userid, String userpwd) {
		// TODO Auto-generated method stub
		
		User user = userMapper.findUser(userid,userpwd);
		
		if(user!=null&&user.getUserid()==userid&&user.getUserpwd().equals(userpwd)){
			return user;
		}
		else{return null;}
	}



	@Override
	public int deleteUserById(long userid){
		// TODO Auto-generated method stub
		return userMapper.deleteUserById(userid);
	}
	@Override
	public List<User> findUserByPage(int index) {
		// TODO Auto-generated method stub
		return userMapper.findUserByPage(index);
	}
	@Override
	public int selectUserCount() {
		// TODO Auto-generated method stub
		return userMapper.selectUserCount();
	}
	@Override
	public int deleteUserByIds(Integer[] uids) {
		// TODO Auto-generated method stub
		return userMapper.deleteUserByIds(uids);
	}

	
	

}
