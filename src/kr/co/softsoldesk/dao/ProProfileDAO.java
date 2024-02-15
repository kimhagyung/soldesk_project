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
   
   // 각 칼럼에 대한 값이 변경될 때마다 프로필 완성도를 업데이트하는 메서드!!!!!!! (실패)
   public void updateProfile_Completion(int pro_id, String pro_name, String active_location,
           String pro_detailed_introduction, String price, int career_id, int education_id, int portfolio_id) {
       int increment = 0;
       if (pro_name != null && !pro_name.isEmpty()) increment += 10;
       if (active_location != null && !active_location.isEmpty()) increment += 10;
       if (pro_detailed_introduction != null && !pro_detailed_introduction.isEmpty()) increment += 10;
       if (price != null && !price.isEmpty()) increment += 10;
       if (career_id != 0) increment += 10;
       if (education_id != 0) increment += 10;
       if (portfolio_id != 0) increment += 10;

       // 기존 프로필 완성도를 가져옴
       int currentCompletion = proProfileMapper.getProfile_Completion(pro_id);

       // 새로운 프로필 완성도 계산
       int newCompletion = Math.min(100, currentCompletion + increment);

       // 프로필 완성도를 업데이트
       proProfileMapper.updateProfile_Completion(pro_id, newCompletion);
   }
   
   public int getProfile_completion(int pro_id) {
	    return proProfileMapper.getProfile_Completion(pro_id);
	}


}