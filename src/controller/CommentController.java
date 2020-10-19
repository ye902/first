package controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import model.Admin;
import model.Comment;
import model.Page;
import model.User;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import service.CommentService;

@Controller
// @RequestMapping("comment")
public class CommentController {
	@Resource
	private CommentService commentService;

	// 显示所有评论
	@RequestMapping(value = "showComments")
	public String test(Model model,String nowpage) {
		int cleraNoUser = commentService.deleteNoUser();
		if(cleraNoUser>0){
			System.out.println(cleraNoUser);
		}
		Page<Comment> page = new Page<Comment>();
		int  pageIndex  = Integer.parseInt(nowpage);
		//当前页面
		page.setPageIndex(pageIndex);
		int index = (pageIndex-1)*5;
//		总记录数
		int total = commentService.selectCount();
		page.setPageNumber(total);
		//总页数
		int pageTotal =total/5;
		if(total%5>0){
			pageTotal+=1;
		}
		page.setPageCount(pageTotal);
		List<Comment> comments = commentService.selectAllComment(index);
		page.setList(comments);
	    model.addAttribute("page" , page );
        return "sysDesign";
		
	}
	
	//删除评论
	@RequestMapping(value="sysDel")
	public String sysDel(HttpSession session,String Uid,String Cid,String nowpage){
		long uid = Long.parseLong(Uid);
		if(session.getAttribute("admin")==null||session.getAttribute("admin")==""){
			System.out.println((Admin)session.getAttribute("admin"));
			return "error";
		}else{
			int count = commentService.deleteCommentById(uid, Cid);
			if(count>0){
				System.out.println("succ:第"+nowpage+"页");
				return "redirect:showComments.do?nowpage="+nowpage;
			}
			else{
				return "error";
			}
			
		}
		
	}
	//批量删除
	@RequestMapping(value="sysDelMore")
	public String sysDelMore(@RequestParam(value="ids")Integer[] ids,HttpSession session){
			for(int i=0;i<ids.length;i++){
				System.out.println("ids="+ids[i]);
			}
		if(session.getAttribute("admin")==null||session.getAttribute("admin")==""){
			return "error";
		}else{
			System.out.println((Admin)session.getAttribute("admin"));
			int more = commentService.deleteCommentByIds(ids);
			if(more > 0){
				System.out.println("succ:"+more);
				return "redirect:showComments.do?nowpage=1";
			}
			else{
				return "error";
			}
			
		}
		
	}
	
	
	

	// 发表评论
	@RequestMapping(value = "insertConmment")
	@ResponseBody
	public Comment insertComment(String textComment, HttpSession session)throws ParseException {
		System.out.println(textComment);
		Date cDate = getDate();
		if (session.getAttribute("userinfo") != null&&textComment!=""&&textComment!=null) {
			User u = (User) session.getAttribute("userinfo");
			long uid = u.getUserid();
			Comment inserCom = new Comment();
			inserCom.setC_date(cDate);
			inserCom.setC_text(textComment);
			inserCom.setGoodNum(0);
			inserCom.setUid(uid);
			
			int count = commentService.insertComment(inserCom);
			if (count > 0) {
				return inserCom;
			}else return null;
			
		}else{
			return null;
		}

	}

	public Date getDate() throws ParseException {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time =simpleDateFormat.format(new Date());
		Date date = simpleDateFormat.parse(time);
		return date;
	}
	
	//分页查询
	@RequestMapping(value="findByPage")
	@ResponseBody
	public Page<Comment> findByPage(String nowpage){
		int cleraNoUser = commentService.deleteNoUser();
		if(cleraNoUser>0){
			System.out.println(cleraNoUser);
		}
//		System.out.println("进错啦");
		Page<Comment> page = new Page<Comment>();
//		System.out.println("nowpage="+nowpage);
		int index = (Integer.parseInt(nowpage)-1)*10;
//		System.out.println("index="+index);
		//总记录数
		int total = commentService.selectCount();
		page.setPageNumber(total);
		//总页数
		int pageTotal =total/10;
		if(total%10>0){
			pageTotal+=1;
		}
//		System.out.println(pageTotal);
		page.setPageCount(pageTotal);
		//每页数据
		List<Comment> comments =commentService.findPage(index);
		page.setList(comments);
		return page;
	}
	
	//删除评论
	@RequestMapping(value="deleteComment")
	@ResponseBody
	public String deleteComment(HttpSession session,String cid){
		Comment delComment = new Comment();
//		System.out.println("进来过");
		User user = (User) session.getAttribute("userinfo");
		long uid=user.getUserid();
		if(session.getAttribute("userinfo")==null){
			return "loginError";
		}else{
			int delCount = commentService.deleteCommentById(uid,cid);
			if(delCount>0){
				return "delsucc";
			}else{
				return "error";
			}
		}
		
	}
	
}
