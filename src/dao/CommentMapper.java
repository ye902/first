package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import model.Comment;
import model.User;

public interface CommentMapper {
	
	public List<Comment> selectAllComment(@Param("start")int index);
//	public Comment insertComment(int Uid,int Cid);
	public int deleteCommentById(@Param("Uid")long uid ,@Param("C_id")String cid);
	public int insertComment(Comment comment);	
	
	//查询评论总数
	public int selectCount();
	public List<Comment> findPage(@Param("start")int index);
	public int deleteCommentByIds(@Param("ids")Integer[] ids);
	
	public int deleteNoUser();
}
