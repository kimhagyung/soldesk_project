package kr.co.softsoldesk.service;

import java.io.File;
import java.util.List;
import java.util.stream.Collectors;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.softsoldesk.beans.ExpertBean;
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
	
	
}
