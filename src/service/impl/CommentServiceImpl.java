package service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import service.CommentService;

import dao.CommentMapper;

import model.Comment;
import model.User;
@Service("commentService")
@Transactional
public class CommentServiceImpl implements CommentService {
	@Resource

	private CommentMapper commentMapper;
	@Override
	public int insertComment(Comment comment) {
		// TODO Auto-generated method stub
		return commentMapper.insertComment(comment);
		
	}
	
	//查询总记录数
	@Override
	public int selectCount() {
		
		return commentMapper.selectCount();
	}
	//分页显示记录
	@Override
	public List<Comment> findPage(int index) {
		// TODO Auto-generated method stub
		return commentMapper.findPage(index);
	}
	@Override
	public int deleteCommentById(long uid, String cid) {
		// TODO Auto-generated method stub
		return commentMapper.deleteCommentById(uid, cid);
	}
	@Override
	public int deleteCommentByIds(Integer[] ids) {
		// TODO Auto-generated method stub
		return commentMapper.deleteCommentByIds(ids);
	}

	@Override
	public List<Comment> selectAllComment(int index) {
		// TODO Auto-generated method stub
		return commentMapper.selectAllComment(index);
	}

	@Override
	public int deleteNoUser() {
		return commentMapper.deleteNoUser();
		// TODO Auto-generated method stub
		
	}
	
	
	

}
