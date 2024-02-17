package kr.co.softsoldesk.service;

import java.io.File;
import java.util.List;
import java.util.stream.Collectors;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.softsoldesk.beans.CareerBean;
import kr.co.softsoldesk.beans.ExpertBean;
import kr.co.softsoldesk.beans.ReviewBean;
import kr.co.softsoldesk.dao.ProProfileDAO;

@Service
public class ProProfileService {
	
	@Autowired
	private ProProfileDAO proProfileDao;
	
	@Value("${path.upload}")
	 private String path_upload;


	public void addExpertInfo(ExpertBean writeExpertInfo) {
		
		proProfileDao.addExpertInfo(writeExpertInfo);
	}
	
	public void modifyIntroduction(String pro_detailed_introduction, int pro_id) {
		
		proProfileDao.modifyIntroduction(pro_detailed_introduction, pro_id);
	}
	
	public boolean expertIntroductionExists(int pro_id) {
        return proProfileDao.countExpertIntroductionByProId(pro_id) > 0;
    }
	
	public List<ExpertBean> getExpertInfoList(int pro_id) {
		
		return proProfileDao.getExpertInfoList(pro_id);
	}
	
	public void modifyPrice(String price, int pro_id) {
		
		proProfileDao.modifyPrice(price, pro_id);
	}
	
	//자격증 이미지
	public void modifyImg(String pro_profile_image, Integer pro_id, List<MultipartFile> uploadFiles) {
	      
      String fileNames = uploadFiles.stream().map(MultipartFile::getOriginalFilename).collect(Collectors.joining(","));
         
         for(MultipartFile uploadFile : uploadFiles) {
            String photo_name = FilenameUtils.getBaseName(uploadFile.getOriginalFilename()) + "." + 
                           FilenameUtils.getExtension(uploadFile.getOriginalFilename());
            
            try {
            uploadFile.transferTo(new File(path_upload + "/" + photo_name));
         } catch (Exception e) {
            e.printStackTrace();
         }
           
         }  
         
         proProfileDao.modifyImg(fileNames, pro_id);
	   }
	   
   public String getImageInfo(int pro_id) {
      return proProfileDao.getImageInfo(pro_id);
   }
   
   //프로필 이미지
   public ExpertBean getProfileInfo(int pro_id) {
	      return proProfileDao.getProfileInfo(pro_id);
	   }
	   
	   
	private String saveUploadFile(MultipartFile upload_file) {
	      
	      String file_name = FilenameUtils.getBaseName(upload_file.getOriginalFilename()) + "." + 
	            FilenameUtils.getExtension(upload_file.getOriginalFilename());
	      
	      
	      try {
	         upload_file.transferTo(new File(path_upload + "/" + file_name));
	      }catch(Exception e) {
	         e.printStackTrace();
	      }
	      
	      return file_name;
	   }
	   
	   public void modifyProfileImg(ExpertBean profileImgExpertBean) {
	      MultipartFile upload_file = profileImgExpertBean.getUpload_file();
	      
	      if(upload_file.getSize() > 0) {
	         String file_name = saveUploadFile(upload_file);
	         profileImgExpertBean.setCertification_documents_images(file_name);
	         
	      }
	      
	      proProfileDao.modifyProfileImg(profileImgExpertBean);
	      
	   }
	   
	   public String getProfileImgInfo(int pro_id) {
	      return proProfileDao.getProfileImgInfo(pro_id);
	   }
	

		//일류 프로필 정보 조회 
		   public List<ExpertBean> getProProfileInfo(){
			   return proProfileDao.getProProfileInfo();
		   }
		   
		 //경력 정보 조회 
		   public List<CareerBean> getCareerInfo(){
			   return proProfileDao.getCareerInfo();
		   }
		   
		 //리뷰조회 
			public List<ReviewBean> getAllReview(){
				return proProfileDao.getAllReview();
			}
}