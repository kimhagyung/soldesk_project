 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value='${pageContext.request.contextPath }/'/>
<script>
		alert('수정되었습니다'); 
	</script>

	<script>
		
	if (${loginProuserBean.prouserLogin}) {
			location.href = '${root}common/AccountSetting?id=${ProAccountModifyCom.getPro_id()}';
		} else if (${loginUserBean.userLogin}) {
			location.href = '${root}common/AccountSetting?id=${AccountModifyCom.user_id}';
		} 

	
	</script>