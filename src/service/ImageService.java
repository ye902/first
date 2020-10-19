package service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import model.Image;

public interface ImageService {
	public List<Image> selectAllImage();
	public List<Image> findImageByPage(int index);
	public int selectImageCount();
	public int deleteImageById(int imgId);
	public int deleteImageByIds(Integer[] imgids);
}
