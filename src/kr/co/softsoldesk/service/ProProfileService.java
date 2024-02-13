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
   
   
}