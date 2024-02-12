package kr.co.softsoldesk.service;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.softsoldesk.beans.InterestBean;
import kr.co.softsoldesk.beans.ProUserBean;
import kr.co.softsoldesk.beans.UserBean;
import kr.co.softsoldesk.dao.InterestDao;

@Service
public class InterestService {

	@Autowired
	private InterestDao interestDao;
	
	public void toggleInterest(int user_id, int pro_id) {
        InterestBean existingInterest = interestDao.findInterest(user_id, pro_id);

        if (existingInterest == null) {
            InterestBean newInterest = new InterestBean();
            newInterest.setUser_id(user_id);
            newInterest.setPro_id(pro_id);
            interestDao.insertInterest(newInterest);
        } else {
            interestDao.deleteInterest(user_id, pro_id);
        }
    }
}
