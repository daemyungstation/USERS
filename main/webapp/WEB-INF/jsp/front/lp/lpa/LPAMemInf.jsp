<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>

					<c:set var="info" value="${rtnMap.info}"/>
					
					<div>
						<p class="memberTxt taC"><img src="/common/images/txt/member_txt2.gif" alt="고객정보 확인"></p>

						<p class="titTxt mt40">회원정보</p>
						<div class="boardType2 mt15">
							<table summary="">
								<caption></caption>
								<colgroup>
									<col width="20%">
									<col width="80%">
								</colgroup>
								<tbody>
									<tr>	
										<th scope="row"><span>회원이름</span></th>
										<td>${info.name}</td>
									</tr>
									<tr>	
										<th scope="row"><span>생년월일</span></th>
										<td>${egov:convertDate(info.birth, 'yyyyMMdd', 'yyyy년 MM월 dd일', '')}</td>
									</tr>
									<tr>	
										<th scope="row"><span class="essen" title="필수입력">이메일</span></th>
										<td>${info.email}</td>
									</tr>
									<tr>	
										<th scope="row"><span class="essen" title="필수입력">휴대전화</span></th>
										<td>${info.hp}</td>
									</tr>
									<tr>	
										<th scope="row"><span>전화번호</span></th>
										<td>${info.tel}</td>
									</tr>
									<tr>	
										<th scope="row"><span class="essen" title="필수입력">주소</span></th>
										<td>(${info.zipcd})&nbsp;${info.adr}&nbsp;${info.adrDtl}</td>
									</tr>
								</tbody>
							</table>
						</div>

						<div class="warnBox mt10" style="padding-top:32px;">
							회원정보에 등록된 기본정보로만 등록이 가능합니다. <br>회원정보 수정은 [나의 라이프웨이 &gt; 개인정보 변경]에서 가능합니다. 변경 후 재신청 바랍니다.
							<a href="/my-lifeway/member/personal-data-change/index.do" class="fr btnRed wide">개인정보 변경</a>
						</div>

						<div class="mt30 taR">
							<a href="./write.do" class="btnRed">확인</a>
							<a href="./agree.do" class="btnRed2">취소</a>
						</div>
					</div>