package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;



import model.Comment;
import model.User;

public interface UserMapper {
	
	public User findUser(@Param("userid")long userid,@Param("userpwd")String userpwd);
	public int insertUser(User user);	
	public int deleteUserById(@Param("userid")long userid);
	public User updatePwdById(User user);
	public List<User> findUserByPage(@Param("start")int index);
	public int selectUserCount();
	public int deleteUserByIds(@Param("uids")Integer[] uids);
}
