<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>
							
						<p class="joinTxt taC"><img src="/common/images/txt/change_service_txt3.gif" alt="신청 완료" /></p>
						
						<div class="termTxtBox service type2 mt40">
							<p class="tit">전환서비스 신청 / 접수가 완료되었습니다.</p>
							<p class="txt">고객님께서 신청해주신 상품은 <strong class="red">${prdctInfo.prdctGb}서비스</strong>입니다.<br />자세한 사항은 '전환 서비스 신청 내역' 에서 확인하실 수 있습니다.</p>
						</div>
						<div class="conNumDiv">
							<div class="conNums">
								<p class="contact1" style="border-right:none;">
									컨택센터<br /><span>1588-8511</span> (평일 09:00 ~ 18:00)
								</p>
								<!-- 
								<p class="contact3">
									e-Mail<br /><span>lifeway_change@Daemyung.com</span>
								</p> 
								-->
							</div>
						</div>

						<div class="taR mt30">
							<a href="/my-lifeway/chage-service/particular/list.do" class="btnRed wide">신청내용 확인</a>
						</div>