<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>   
	<script src="${root}/script/jquery-3.4.1.min.js"></script> 
   <style>
    #weatherWidget .currentDesc {
        color: #ffffff!important;
    }
        .traffic-chart {
            min-height: 335px;
        }
        #flotPie1  {
            height: 150px;
        }
        #flotPie1 td {
            padding:3px;
        }
        #flotPie1 table {
            top: 20px!important;
            right: -10px!important;
        }
        .chart-container {
            display: table;
            min-width: 270px ;
            text-align: left;
            padding-top: 10px;
            padding-bottom: 10px;
        }
        #flotLine5  {
             height: 105px;
        }

        #flotBarChart {
            height: 150px;
        }
        #cellPaiChart{
            height: 160px;
        }

    </style>
</head>

<body>
	 <c:import url="/WEB-INF/views/admin/header.jsp" />
    <!-- /#left-panel -->
    <!-- Right Panel -->
    <div id="right-panel" class="right-panel"> 
        <!-- Content -->
        <div class="content">
            <!-- Animated -->
            <div class="animated fadeIn">
                <!-- Widgets  -->
                <div class="row">
					 <div class="col-lg-3 col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="stat-widget-five">
                                    <div class="stat-icon dib flat-color-4">
                                        <i class="pe-7s-users"></i>
                                    </div>
                                    <div class="stat-content">
                                        <div class="text-left dib">
                                            <div class="stat-text"><span class="count">32</span></div>
                                            <div class="stat-heading">사용자</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
               
	                
	                 <div class="col-lg-3 col-md-6">
	                        <div class="card">
	                            <div class="card-body">
	                                <div class="stat-widget-five">
	                                    <div class="stat-icon dib flat-color-5">
	                                        <i class="pe-7s-users"></i>
	                                    </div>
	                                    <div class="stat-content">
	                                        <div class="text-left dib">
	                                            <div class="stat-text"><span class="count">22</span></div>
	                                            <div class="stat-heading">일류</div>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                   </div>
				</div>	
             </div>
          </div> 
       </div>   
                <!-- /Widgets -->
                <!--  Traffic  -->
               
                <!--  /Traffic -->
                <div class="clearfix"></div>
                <!-- Orders -->
       
</body>
</html>