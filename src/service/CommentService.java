package service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import model.Comment;
import model.User;

public interface CommentService {
	public int insertComment(Comment comment);
	public List<Comment> selectAllComment(int index);
	public int deleteCommentById(long uid ,String cid);
	
	public int selectCount();
	public List<Comment> findPage(int index);
	public int deleteCommentByIds(Integer[] ids);
	
	public int deleteNoUser();
}
