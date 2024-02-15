<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!doctype html> 
<head>
   	<script src="${root}/script/jquery-3.4.1.min.js"></script> 
</head> 
<body> 
 <c:import url="/WEB-INF/views/admin/header.jsp" />
    <div id="right-panel" class="right-panel">
 
        <div class="breadcrumbs">
            <div class="breadcrumbs-inner">
                <div class="row m-0">
                    <div class="col-sm-4">
                        <div class="page-header float-left">
                            <div class="page-title">
                                <h1>검수 요청 포트폴리오</h1>
                            </div>
                        </div>
                    </div> 
                </div>
            </div>
        </div>

        <div class="content">
            <div class="animated fadeIn">
                <div class="row">  
                	<c:forEach var="portfolio" items="${allportfolio }">
	                    <div class="col-md-4">
	                        <div class="card">
	                            <c:if test="${portfolio.detailed_images != null}">
									<c:forEach var="portfolio_img" items="${fn:split(portfolio.detailed_images, ',')}" varStatus="loop">
										<c:if test="${loop.index == 0}"> 
		  									<img src="${root}/portfolio/${portfolio_img}" class="card-img-top">
										</c:if> 
									</c:forEach>
								</c:if>	  		
	                            <div class="card-body">
	                            	<div class="row">
	                            		<div class="col-8"> 
			                                <h4 class="card-title mb-3">작성자 :${portfolio.portfolio_title }</h4>
			                                <p class="card-text detailed">내용: ${portfolio.detailed_introduction }</p>
	                            		</div>
	                            		<div class="col-4"> 
											<button type="button" class="btn btn-info  mt-3" data-bs-toggle="modal" data-bs-target="#exampleModal">
											  자세히 보기
											</button>
	                            		</div>
	                            	</div>
	                            </div>
	                        </div>
	                    </div>  
                    </c:forEach>
                </div> 
            	</div><!-- .animated -->
        </div><!-- .content -->

    <div class="clearfix"></div>

    <footer class="site-footer">
        <div class="footer-inner bg-white">
            <div class="row">
                <div class="col-sm-6">
                    Copyright &copy; 2018 Ela Admin
                </div>
                <div class="col-sm-6 text-right">
                    Designed by <a href="https://colorlib.com">Colorlib</a>
                </div>
            </div>
        </div>
    </footer>


    </div><!-- /#right-panel -->


</body>
</html>
