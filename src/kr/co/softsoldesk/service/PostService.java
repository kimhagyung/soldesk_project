package kr.co.softsoldesk.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.annotation.Resource;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.softsoldesk.beans.PostBean;
import kr.co.softsoldesk.beans.ProUserBean;
import kr.co.softsoldesk.beans.UserBean;
import kr.co.softsoldesk.dao.PostDao;

@Service
@PropertySource("/WEB-INF/properties/option.properties")
public class PostService {
   
   @Value("${path.upload}")
   private String path_upload;
   
   @Autowired
   private PostDao postDao;
   
   @Resource(name = "loginUserBean")
   private UserBean loginUserBean;
   
   @Resource(name = "loginProuserBean")
   private ProUserBean loginProuserBean;
   
   public void addBoardPostInfo(PostBean boardPostBean, List<MultipartFile> uploadFiles) {

	   String fileNames = uploadFiles.stream().map(MultipartFile::getOriginalFilename).collect(Collectors.joining(","));
	   boardPostBean.setPhotos(fileNames);
	   
	   for(MultipartFile uploadFile : uploadFiles) {
		   String photo_name = FilenameUtils.getBaseName(uploadFile.getOriginalFilename()) + "." + 
				   			FilenameUtils.getExtension(uploadFile.getOriginalFilename());
		   
		   try {
			uploadFile.transferTo(new File(path_upload + "/" + photo_name));
		} catch (Exception e) {
			e.printStackTrace();
		}
		  
	   }  
	   //유저가 0이면(프로 가입)
	   //writeContentBean.setContent_writer_idx(loginUserBean.getUser_idx());
	   if(loginProuserBean.isProuserLogin()==true) {

		   boardPostBean.setPro_id(loginProuserBean.getPro_id());
	   } 
	   else if(loginUserBean.isUserLogin()==true) { 
		   boardPostBean.setUser_id(loginUserBean.getUser_id()); 
	   }
       postDao.addBoardPostInfo(boardPostBean);
   }
   
   public List<PostBean> getAllPostList(){
	   return postDao.getAllPostList();
   }
   
   public PostBean getPostInfo(int board_id) {
	   return postDao.getPostInfo(board_id);
   }
   
   public void modifyPostInfo(PostBean modifyPostBean, List<MultipartFile> uploadFiles) { 
	   String fileNames = uploadFiles.stream().map(MultipartFile::getOriginalFilename).collect(Collectors.joining(","));
	   modifyPostBean.setPhotos(fileNames);
	   
	   for(MultipartFile uploadFile : uploadFiles) {
		   String photo_name = FilenameUtils.getBaseName(uploadFile.getOriginalFilename()) + "." + 
				   			FilenameUtils.getExtension(uploadFile.getOriginalFilename());
		   
		   try {
			uploadFile.transferTo(new File(path_upload + "/" + photo_name));
		} catch (Exception e) {
			e.printStackTrace();
		}
		  
	   }
	   
	   postDao.modifyPostInfo(modifyPostBean);
   }
   
   public void deletePostInfo(int board_id) {
	   postDao.deletePostInfo(board_id);
   }

   
   public void plusCnt(int board_id)
   {
	   postDao.plusCnt(board_id);
   }
   

}