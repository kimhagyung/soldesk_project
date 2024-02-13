package kr.co.softsoldesk.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.beans.ExpertBean;
import kr.co.softsoldesk.mapper.ProProfileMapper;

@Repository
public class ProProfileDAO {

   @Autowired
   private ProProfileMapper proProfileMapper;
   
   public void addExpertInfo(ExpertBean writeExpertInfo) {
      
      proProfileMapper.addExpertInfo(writeExpertInfo);
   }
   
   public void modifyIntroduction(String pro_detailed_introduction, int pro_id ) {
      
      proProfileMapper.modifyIntroduction(pro_detailed_introduction, pro_id);
   }
   
   public int countExpertIntroductionByProId(int pro_id) {
      return proProfileMapper.countExpertIntroductionByProId(pro_id);
   }
   
   public List<ExpertBean> getExpertInfoList(int pro_id) {
      
      return proProfileMapper.getExpertInfoList(pro_id);
   }
   
   public void modifyPrice(String price, int pro_id) {
      
      proProfileMapper.modifyPrice(price, pro_id);
   }
}