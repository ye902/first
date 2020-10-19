package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import model.Image;

public interface ImageMapper {
	public List<Image> selectAllImage();
	public List<Image> findImageByPage(@Param("start")int index);
	public int selectImageCount();
	public int deleteImageById(@Param("imgId")int imgId);
	public int deleteImageByIds(@Param("imgids")Integer[] imgids);
}
