package service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import model.User;

public interface UserService {
	
	public int insertUser(User user);	
	public int deleteUserById(long userid);
	public User updatePwdById(User user);
	public User checkLogin(long userid,String userpwd);
	public List<User> findUserByPage(int index);
	public int selectUserCount();
	public int deleteUserByIds(Integer[] uids);
}
