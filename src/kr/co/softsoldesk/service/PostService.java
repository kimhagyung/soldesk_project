package kr.co.softsoldesk.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
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
   
   private List<String> saveUploadFiles(List<MultipartFile> upload_photos) {
       List<String> file_names = new ArrayList<>();

       for (MultipartFile upload_photo : upload_photos) {
           String file_name = System.currentTimeMillis() + "_" + FilenameUtils.getBaseName(upload_photo.getOriginalFilename()) + "." +
                   FilenameUtils.getExtension(upload_photo.getOriginalFilename());

           try {
               upload_photo.transferTo(new File(path_upload + "/" + file_name));
               file_names.add(file_name);
           } catch (Exception e) {
               e.printStackTrace();
           }
       }

       return file_names;
   }

   

   public void addPostInfo(PostBean boardPostBean) {
       List<MultipartFile> upload_photos = boardPostBean.getUpload_photos();

       if (upload_photos != null && !upload_photos.isEmpty()) {
           List<String> file_names = saveUploadFiles(upload_photos);
           boardPostBean.setPhotos(file_names);
           
       }
       
       System.out.println(boardPostBean.getPhotos());

       /*
       Integer userLoginID = loginUserBean.getUser_id();
       Integer proLoginID = loginProuserBean.getPro_id();

       if (userLoginID != null) {
           boardPostBean.setUser_id(userLoginID);
           System.out.println("userLoginID Bean에 저장" + boardPostBean.getUser_id());
       } else {
           boardPostBean.setPro_id(proLoginID);
           System.out.println("나중에,,,");
       }
       */

       postDao.addBoardPostInfo(boardPostBean);
   }
   
   public List<PostBean> getAllPostList(){
	   return postDao.getAllPostList();
   }

}