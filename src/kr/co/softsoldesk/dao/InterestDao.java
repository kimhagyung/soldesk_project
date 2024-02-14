package kr.co.softsoldesk.dao;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.beans.InterestBean;
import kr.co.softsoldesk.beans.UserBean;
import kr.co.softsoldesk.mapper.InterestMapper;

@Repository
public class InterestDao {

	@Autowired
	private InterestMapper interestMapper;
	
	public void insertInterest(InterestBean interestBean) {
        interestMapper.insertInterest(interestBean);
    }

    public void deleteInterest(int user_id, int pro_id) {
        interestMapper.deleteInterest(user_id, pro_id);
    }

    public InterestBean findInterest(int user_id, int pro_id) {
        return interestMapper.findInterest(user_id, pro_id);
    }
}