package service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.ImageMapper;

import model.Image;
import service.ImageService;
@Service("ImageService")
@Transactional
public class ImageServiceImpl implements ImageService {
	@Resource ImageMapper imageMapper;
	@Override
	public List<Image> selectAllImage() {
		// TODO Auto-generated method stub
		return imageMapper.selectAllImage();
	}
	@Override
	public List<Image> findImageByPage(int index) {
		// TODO Auto-generated method stub
		return imageMapper.findImageByPage(index);
	}
	@Override
	public int selectImageCount() {
		// TODO Auto-generated method stub
		return imageMapper.selectImageCount();
	}
	@Override
	public int deleteImageById(int imgId) {
		// TODO Auto-generated method stub
		return imageMapper.deleteImageById(imgId);
	}
	@Override
	public int deleteImageByIds(Integer[] imgids) {
		// TODO Auto-generated method stub
		return imageMapper.deleteImageByIds(imgids);
	}

}
