<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head> 
    <meta name="description" content="Ela Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png">
    <link rel="shortcut icon" href="https://i.imgur.com/QRAUqs9.png">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.5.1/css/all.css">


    <link rel="stylesheet" href="${root}/assets/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="${root}/assets/css/style.css">
    <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
    <link href="https://cdn.jsdelivr.net/npm/chartist@0.11.0/dist/chartist.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/jqvmap@1.5.1/dist/jqvmap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/weathericons@2.1.0/css/weather-icons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/fullcalendar@3.9.0/dist/fullcalendar.min.css" rel="stylesheet" />
  
	<script src="${root}/script/jquery-3.4.1.min.js"></script> 
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- Header-->
        <div id="right-panel" class="right-panel">
        <!-- Header-->
        <header id="header" class="header" style="background-color:  #D9E8F5;">
            <div class="top-left">
                <div class="navbar-header" style="background-color:  #D9E8F5;">
                    <a class="navbar-brand" href="${root }/admin/index" style="width: 150px;"><img src="${root }/image/logo4.png" alt="Logo" style="width: 50px; height: 42px;"></a>
                    <a class="navbar-brand hidden" href="${root }/admin/index"><img src="${root }/image/logo4.png" alt="Logo"></a>
                    <a id="menuToggle" class="menutoggle" style="margin-left: 10px;"><i class="fa fa-bars"></i></a>
                </div>
            </div>
            <div class="top-right">
                <div class="header-menu">
                    <div class="header-left">
                        <button class="search-trigger"><i class="fa fa-search"></i></button>
                        <div class="form-inline">
                            <form class="search-form">
                                <input class="form-control mr-sm-2" type="text" placeholder="Search ..." aria-label="Search">
                                <button class="search-close" type="submit"><i class="fa fa-close"></i></button>
                            </form>
                        </div>

                        <div class="dropdown for-notification">
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="notification" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fa fa-bell"></i>
                                <span class="count bg-danger">3</span>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="notification">
                                <p class="red">You have 3 Notification</p>
                                <a class="dropdown-item media" href="#">
                                    <i class="fa fa-check"></i>
                                    <p>Server #1 overloaded.</p>
                                </a>
                                <a class="dropdown-item media" href="#">
                                    <i class="fa fa-info"></i>
                                    <p>Server #2 overloaded.</p>
                                </a>
                                <a class="dropdown-item media" href="#">
                                    <i class="fa fa-warning"></i>
                                    <p>Server #3 overloaded.</p>
                                </a>
                            </div>
                        </div>

                        <div class="dropdown for-message">
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="message" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" onclick="moveToReport()">

								<i class="bi bi-brightness-alt-high" style="font-size: 20px;"></i>
								<!-- 들어온 신고 수 -->
								<c:if test="${alarmReportBean.getReportCnt() != 0}">
									<span class="count bg-primary">${alarmReportBean.getReportCnt() }</span>
								</c:if>
								

							</button>
                            
                        </div>
                    </div>

                    <!-- <div class="user-area dropdown float-right">
                        <a href="#" class="dropdown-toggle active" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img class="user-avatar rounded-circle" src="images/admin.jpg" alt="User Avatar">
                        </a>

                        <div class="user-menu dropdown-menu">
                            <a class="nav-link" href="#"><i class="fa fa- user"></i>My Profile</a>

                            <a class="nav-link" href="#"><i class="fa fa- user"></i>Notifications <span class="count">13</span></a>

                            <a class="nav-link" href="#"><i class="fa fa -cog"></i>Settings</a>

                            <a class="nav-link" href="#"><i class="fa fa-power -off"></i>Logout</a>
                        </div>
                    </div> -->

                </div>
            </div>
        </header> 
        </div>
    <!-- Left Panel -->
    <aside id="left-panel" class="left-panel">
        <nav class="navbar navbar-expand-sm navbar-default">
            <div id="main-menu" class="main-menu collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li class="active">
                        <a href="${root }/admin/index"><i class="menu-icon fa fa-laptop"></i>메인 </a>
                    </li>
                    <li class="menu-title">회원관리</li><!-- /.menu-title --> 
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-cogs"></i>회원관리</a>
                        <ul class="sub-menu children dropdown-menu">                            
							<li><i class="fa fa-solid fa-user"></i><a href="${root }/admin/user">회원 관리</a></li>
                            <li><i class="fa fa-solid fa-user"></i><a href="${root }/admin/pro">일류 관리</a></li>
                        </ul>
                    </li>
                    <li class="menu-title">게시글 관리</li><!-- /.menu-title --> 
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-cogs"></i>게시글 관리</a>
                        <ul class="sub-menu children dropdown-menu">                            
							<li><i class="fa fa-solid fa-user"></i><a href="${root }/admin/community" aria-haspopup="true" aria-expanded="false">게시글 관리</a></li>
                            <li><i class="fa-solid fa-circle-exclamation" style="color: #ff0000;"></i><a href="${root }/admin/report">신고 관리</a></li>
                        </ul>
                    </li>
                    <li class="menu-title">카테고리 관리</li><!-- /.menu-title --> 
                    <li class="menu-item-has-children dropdown">
                        <a href="${root }/admin/category"  aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-cogs"></i>카테고리 관리</a>
                    </li> 
                    
                    <li class="menu-title">금지어 관리</li><!-- /.menu-title --> 
                    <li class="menu-item-has-children dropdown">
                        <a href="${root }/admin/forbiddenWords"  aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-cogs"></i>금지어 관리</a>
                    </li>  
                    
                    <li class="menu-title"> 포트폴리오 검수  </li><!-- /.menu-title -->
                    
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-cogs"></i>포트폴리오 검수</a>
                        <ul class="sub-menu children dropdown-menu">                            
							<li><i class="fa fa-puzzle-piece"></i><a href="${root }/admin/portfolioIncpection">검수필요</a></li> 
							<li><i class="fa fa-puzzle-piece"></i><a href="${root }/admin/Completportfolio">검수완료</a></li> 
                        </ul>
                    </li>
                     
                </ul>
            </div><!-- /.navbar-collapse -->
        </nav>
    </aside>
   
    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
    <script src="assets/js/main.js"></script>


    <script src="assets/js/lib/data-table/datatables.min.js"></script>
    <script src="assets/js/lib/data-table/dataTables.bootstrap.min.js"></script>
    <script src="assets/js/lib/data-table/dataTables.buttons.min.js"></script>
    <script src="assets/js/lib/data-table/buttons.bootstrap.min.js"></script>
    <script src="assets/js/lib/data-table/jszip.min.js"></script>
    <script src="assets/js/lib/data-table/vfs_fonts.js"></script>
    <script src="assets/js/lib/data-table/buttons.html5.min.js"></script>
    <script src="assets/js/lib/data-table/buttons.print.min.js"></script>
    <script src="assets/js/lib/data-table/buttons.colVis.min.js"></script>
    <script src="assets/js/init/datatables-init.js"></script>

	<script>
    function moveToReport() {
     
    	var root = "${root}"; // root 변수가 어디서 가져오는지에 따라 수정이 필요할 수 있음
        var targetUrl = root + "/admin/report";

        // 페이지 이동
        window.location.href = targetUrl;
    }
</script>

</body>
</html>