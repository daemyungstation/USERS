<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@
	include file="/WEB-INF/jsp/include/el.jspf"
%>

<html lang="ko">
	<head> 
		<meta charset="utf-8" />
		<link rel="stylesheet" href="/common/css/eis_sub_style.css">
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	</head>
	
	<div id="cBody">
	
		<!-- 날짜 가져오기 -->
		<jsp:useBean id="now" class="java.util.Date" />
		<fmt:formatDate var="nowDt" value="${now}" pattern="yyyyMMddhhmm" />
		<c:forEach var="list" items="${rtnMap.list}">
			<c:set var="reg_cnt" value="${list.accCnt}" />
			<c:set var="evt_cnt" value="${list.eventCnt}" />
			<c:set var="resn_cnt" value="${list.resnCnt}" />
			<c:set var="manresn_cnt" value="${list.manresnCnt}" />
			<c:set var="man_cnt" value="${list.manCnt}" />
		</c:forEach>
	
		<div class="subBody">
			<div id="subCon">
				<div class="sub">
					<!-- 
					<div id="img_jewelry_pc" style="display:none" class="tab-con">		
						ssdfsd
					</div>
					 -->
					<div id="img_jewelry_pc">		
						<div class="sub">
							<div class="sub-con6" >
								<div class="tab-header">
									<div class="toplogo">
										<img src="/common/images/sub07/main_logo.jpg" class="imgmain" alt="">
										<div class="tx-wrap1">
											<div class="icon-wrap"></div>											
											<div class="tx1 white">${egov:convertDate(nowDt, 'yyyyMMddhhmm', 'MM-dd hh:mm', '')} 인입현황</div>
										</div>																
									</div>																	
								</div>							
							</div>	
							
							<div>
								<div class="tab-main">
									<div class="mainitem">
										<div class="tx1">접수현황</div>
										<div class="tx1">${reg_cnt} 건</div>
									</div>
								</div>
							</div>
							
							<div>
								<div class="tab-main">
									<div class="mainitem">
										<div class="tx1">행사현황</div>
										<div class="tx1">${evt_cnt} 건</div>
									</div>
								</div>
							</div>
							
							<div>
								<div class="tab-main">
									<div class="mainitem">
										<div class="tx-item">
											<div class="tx2">중도해약</div>
											<div class="tx2">${resn_cnt} 건</div>																		
										</div>		
										<div class="tx-item">
											<div class="tx2">만기해약</div>
											<div class="tx2">${manresn_cnt} 건</div>																		
										</div>	
										<div class="tx-item">
											<div class="tx2">해약방어</div>
											<div class="tx2">${man_cnt} 건</div>																		
										</div>																																																
									</div>
								</div>
							</div>						
																
							<!-- 
							<div>
								<div id="tab01-01" class="tab-con" style="display: block;" >				
									<div class="sub-con15">
										<div class="item3">
											<img src="/common/images/jewelry/pc/7_pc.jpg" alt="">
											<div class="tx1" style="background-color: #C4B73B; padding: 8px;">Black Lavel</div>
										</div>
									</div>
									<div class="sub-con15">
										<div class="item3">
											<img src="/common/images/jewelry/pc/7_pc.jpg" alt="">
											<div class="tx1" style="background-color: #C4B73B; padding: 8px;">Black Lavel</div>
										</div>
									</div>
									<div class="sub-con15">
										<div class="item3">
											<img src="/common/images/jewelry/pc/7_pc.jpg" alt="">
											<div class="tx1" style="background-color: #C4B73B; padding: 8px;">Black Lavel</div>
										</div>
									</div>																
								</div>
							</div>
							 -->
						</div>
						
					</div>	 
				</div>
			</div>
		</div>	
	</div>
</html>