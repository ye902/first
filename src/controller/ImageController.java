package controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import model.Image;
import model.Page;
import model.User;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import service.ImageService;

@Controller
public class ImageController {
	@Resource
	private ImageService imageService;

	@RequestMapping(value = "showImages")
	@ResponseBody
	public List<Image> showImage() {
		List<Image> imgs = imageService.selectAllImage();
		return imgs;
	}

	// 显示所有图片信息
	@RequestMapping(value = "sysShowImages")
	public String test(Model imageModel, String nowpage) {
		Page<Image> page = new Page<Image>();
		int pageIndex = Integer.parseInt(nowpage);
		// 当前页面
		page.setPageIndex(pageIndex);
		int index = (pageIndex - 1) * 5;
		// 总记录数
		int total = imageService.selectImageCount();
		page.setPageNumber(total);
		// 总页数
		int pageTotal = total / 5;
		if (total % 5 > 0) {
			pageTotal += 1;
		}
		page.setPageCount(pageTotal);
		List<Image> imgs = imageService.findImageByPage(index);
		page.setList(imgs);
		imageModel.addAttribute("imgsPage", page);
		return "sysImageDesign";

	}
	//删除图片信息
	@RequestMapping(value="sysImageDel")
	public String sysDel(String imgId,String nowpage,HttpSession session){
		int rqid = Integer.parseInt(imgId);
		if(session.getAttribute("admin")==null){
			return "error";
		}else{
			int count =imageService.deleteImageById(rqid);
			if(count>0){
				System.out.println("succ:第"+nowpage+"页");
				return "redirect:sysShowImages.do?nowpage="+nowpage;
			}else{
				return "error";
			}
		}
		
	}
	//批量删除
	
			@RequestMapping(value="sysImageDelMore")
			public String sysDelMore(@RequestParam(value="imgids")Integer[] imgids,HttpSession session){
					for(int i=0;i<imgids.length;i++){
						System.out.println("ids="+imgids[i]);
					}
				if(session.getAttribute("admin")==null||session.getAttribute("admin")==""){
					return "error";
				}else{
					int more = imageService.deleteImageByIds(imgids);
					if(more > 0){
						System.out.println("succ:"+more);
						return "redirect:sysShowImages.do?nowpage=1";
					}else{
						return "error";
					}
				}
			}
}
