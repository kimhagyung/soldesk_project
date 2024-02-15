package kr.co.softsoldesk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.softsoldesk.beans.ExpertBean;
import kr.co.softsoldesk.dao.PostDao;
import kr.co.softsoldesk.dao.ProProfileDAO;

@Service
public class ProProfileService {
   
   @Autowired
   private ProProfileDAO proProfileDao;


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
   
   // 각 칼럼에 대한 값이 변경될 때마다 프로필 완성도를 업데이트하는 메서드!!!!!!!!!! (실패)
   public void updateProfile_Completion(int pro_id, String pro_name, String active_location, String pro_detailed_introduction,
           String price, int career_id, int education_id, int portfolio_id) {
       proProfileDao.updateProfile_Completion(pro_id, pro_name, active_location, pro_detailed_introduction,
               price, career_id, education_id, portfolio_id);
   }
   
   public int getProfile_completion(int pro_id) {
	    return proProfileDao.getProfile_completion(pro_id);
	}

   
   
}