package kr.co.softsoldesk.Validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import kr.co.softsoldesk.beans.ProUserBean; 

public class ProUserValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return ProUserBean.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ProUserBean proUserBean = (ProUserBean) target;

		String beanName = errors.getObjectName();
		/*
		 * 타깃으로 받아온 객체가 joinUserbean이 아니면 에러 (로그인 객체도 @valid가 있어 타깃으로 넘어오기 때문에 걸러줘야됨)
		 */
 
			if (beanName.equals("joinProuserBean")) {

				if (proUserBean.isProuserEmailExist() == false) {
					errors.rejectValue("pro_email", "DonCheckProuserIdExist");
				} // 중복확인을 하지 않을채로 가입을 눌렀을경우 중복확인 하라는 메시지 띄어줌
		 
		}
	}
}
