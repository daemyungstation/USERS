<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>
						<div class="termDiv">
							<p class="tit">개인정보 수집 및 활용 동의</p>
							<button class="check" type="button">
								<strong>동의합니다.</strong>
								<img alt="체크" src="/common/images/btn/check_bt.gif" />
							</button>

							<div class="termBox">
								<p class="tit">[대명스테이션 고객의소리 접수를 위한 개인정보 수집 및 이용 동의서]<br /><br />주식회사 대명스테이션은 고객의소리 접수와 관련하여 아래와 같이 개인정보를 수집, 이용하고자 합니다.</p>
								<br />
								<p class="tit">■ 개인정보 수집, 이용 내역</p>
								<p> 
									- 수집/이용자 : 주식회사 대명스테이션<br /> 
									- 수집/이용 개인정보 항목 : 이름, 연락처(휴대폰 또는 집전화), 이메일주소, 회원번호, 관련 사업장, 발생일자<br /> 
									- 수집/이용 목적 : "고객의소리" 의견에 대한 사실관계 확인, 고객의견에 대한 회신, 조치 및 처리 결과의 통보,감사 말씀 전달<br />
									- - 보유시간 : 소비자 불만 또는 분쟁처리에 관한 기록 보존을 위해 3년간 보유<br /><br /> 
									* 고객님은 위의 개인정보 수집, 이용에 대한 동의를 거부할 수 있습니다. 그러나 동의를 거부할 경우 고객의 소리접수에 제한을 받을 수 있습니다.
								</p>
							</div>
						</div>
						<form id="frm" name="frm" method="post" action="./insert.do">
							<input type="hidden" name="csrfPreventionSalt" value="${csrfPreventionSalt}" class="notRequired" />
							<input type="hidden" id="agreeYn" name="agreeYn" value="N" class="notRequired" />
							
							<div class="boardType2 mt15">
								<table summary="">
									<caption></caption>
									<colgroup>
										<col width="20%" />
										<col width="80%" />
									</colgroup>
									<tbody>
										<tr>	
											<th scope="row"><span class="essen" title="필수입력">구분</span></th>
											<td>
												<label><input type="radio" name="ind" id="ind01" value="01" title="구분">&nbsp;칭찬</label>&nbsp;&nbsp;
												<label><input type="radio" name="ind" id="ind02" value="02" title="구분">&nbsp;불편</label>&nbsp;&nbsp;
												<label><input type="radio" name="ind" id="ind03" value="03" title="구분">&nbsp;문의</label>&nbsp;&nbsp;
											</td>
										</tr>
										<tr>	
											<th scope="row"><span class="essen" title="필수입력">제목</span></th>
											<td>
												<input type="text" name="title" value="" title="제목" class="inputType4" style="" maxlength="30" />
											</td>
										</tr>
										<tr>	
											<th scope="row"><span class="essen" title="필수입력">이름</span></th>
											<td>
												<input type="text" name="guestNm" value="" title="이름" class="inputType4" style="" maxlength="20" />
											</td>
										</tr>
										<tr>	
											<th scope="row">연락처</th>
											<td>
												<label><input type="radio" name="moblType" id="moblType01" value="mobile" class="notRequired" checked>&nbsp;휴대폰</label>&nbsp;&nbsp;
												<label><input type="radio" name="moblType" id="moblType02" value="home" class="notRequired" >&nbsp;집전화</label><br>
												
												<select name="moblNo1" id="moblNo1" title="전화번호" class="inputType3 notRequired">
													<option value="010">010</option>
													<option value="011">011</option>
													<option value="016">016</option>
													<option value="017">017</option>
													<option value="018">018</option>
													<option value="019">019</option>
													<option value="0130">0130</option>
												</select>
												<select name="homeNo1" id="homeNo1" title="전화번호" class="inputType3 notRequired" style="display:none;">
													<option value="02">02</option>
													<option value="031">031</option>
													<option value="032">032</option>
													<option value="033">033</option>
													<option value="041">041</option>
													<option value="042">042</option>
													<option value="043">043</option>
													<option value="051">051</option>
													<option value="052">052</option>
													<option value="053">053</option>
													<option value="054">054</option>
													<option value="055">055</option>
													<option value="061">061</option>
													<option value="062">062</option>
													<option value="063">063</option>
													<option value="064">064</option>
													<option value="070">070</option>
												</select>
												 - 
												<input type="tel" name="moblNo2" value="" title="전화번호" class="inputType3 onlynum notRequired" style="" maxlength="4" /> - 
												<input type="tel" name="moblNo3" value="" title="전화번호" class="inputType3 onlynum notRequired" style="" maxlength="4" />
											</td>
										</tr>
										<tr>	
											<th scope="row">이메일</th>
											<td>
												<input type="text" name="emailAddr1" value="" title="이메일 아이디" class="inputType2 notRequired" style="" maxlength="100" /> @ 
												<input type="text" name="emailAddr2" value="" title="이메일 도메인" class="inputType2 notRequired" style="" maxlength="100" />
												<select id="maillist" class="inputType2 notRequired">
													<option value="">[도메인 선택]</option>
													<option value="naver.com">naver.com</option>
													<option value="daum.net">daum.net</option>
													<option value="gmail.com">gmail.com</option>
													<option value="hanmail.net">hanmail.net</option>												
													<option value="nate.com">nate.com</option>												
												</select>
											</td>
										</tr>
										<tr>	
											<th scope="row">성별/나이</th>
											<td>
												<label><input type="radio" name="gen" value="1" class="notRequired" title="성별">&nbsp;남</label>&nbsp;&nbsp;
												<label><input type="radio" name="gen" value="2" class="notRequired" title="성별">&nbsp;여</label>&nbsp;&nbsp;
												
												<input type="tel" name="age" value="" title="나이" class="inputType3 onlynum notRequired" style="" maxlength="2" />세
											</td>
										</tr>
										<tr>	
											<th scope="row">거주지역</th>
											<td>
												<select name="locate" class="inputType1 notRequired" title="거주지역">
													<option value=''>= 거주지역선택 =</option>
													<option value='01'>서울</option>
													<option value='02'>경기</option>
													<option value='03'>인천</option>
													<option value='04'>강원</option>
													<option value='05'>대전</option>
													<option value='06'>광주</option>
													<option value='07'>대구</option>
													<option value='08'>부산</option>
													<option value='09'>울산</option>
													<option value='10'>충남</option>
													<option value='11'>충북</option>
													<option value='12'>경남</option>
													<option value='13'>경북</option>
													<option value='14'>전남</option>
													<option value='15'>전북</option>
													<option value='16'>제주</option>
													<option value='17'>미확인</option>
													<option value='99'>기타</option>
												</select>
											</td>
										</tr>
										<tr>	
											<th scope="row"><span class="essen" title="필수입력">관련사업장</span></th>
											<td>
												<select name="storeCd" class="inputType1" title="관련사업장">
													<option value=''>= 사업장선택 =</option>
													<option value='01'>비발디파크</option>
													<option value='12'>오션월드</option>
													<option value='28'>스키월드</option>
													<option value='33'>골프클럽</option>
													<option value='18'>소노펠리체 비발디파크</option>
													<option value='02'>델피노</option>
													<option value='13'>쏠비치 양양</option>
													<option value='27'>쏠비치 삼척</option>
													<option value='04'>소노문 양평</option>
													<option value='03'>소노문 단양</option>
													<option value='10'>소노벨 경주</option>
													<option value='17'>소노벨 변산</option>
													<option value='22'>소노캄 거제</option>
													<option value='29'>소노벨 청송</option>
													<option value='30'>소노벨 천안</option>
													<option value='14'>소노벨 제주</option>
													<option value='32'>소노캄 제주</option>
													<option value='19'>소노캄 여수</option>
													<option value='20'>소노캄 고양</option>
													<option value='35'>쏠비치 진도</option>
													<option value='31'>내린천휴게소</option>
													<option value='07'>회원관리/예약</option>
													<option value='11'>홈페이지/앱</option>
													<option value='34'>소노펠리체컨벤션</option>
													<option value='36'>소노펫클럽앤리조트 비발디파크</option>
													<option value='A1'>대명건설</option>
													<option value='A2'>소노시즌</option>
													<option value='A3' selected>대명아임레디</option>
													<option value='A4'>IRIS(법인사예약)</option>
													<option value='A5'>IMP(소노통합구매)</option>
												</select>
											</td>
										</tr>
										<tr>	
											<th scope="row"><span class="essen" title="필수입력">카테고리</span></th>
											<td>
												<select name="category1" class="inputType1" title="카테고리">
													<option value=''>= 카테고리 선택 =</option>
													<option value='D1'>회원관리</option>
													<option value='D2'>상품관리</option>
													<option value='D3'>멤버십서비스</option>
													<option value='D4'>기타</option>
												</select>
												
												<select name="category2" class="inputType1" title="카테고리 상세">
													<option value=''>= 카테고리 상세 선택 =</option>
												</select>
											</td>
										<tr>	
											<th scope="row"><span class="essen" title="필수입력">발생일자</span></th>
											<td>
												<input type="text" name="storeDate" id="storeDate" value="" title="발생일자" class="inputType1" style="" readonly />
												<img alt="날짜" src="/common/images/icon/calendar_icon.gif" onclick="jQuery(this).prev().focus();" style="vertical-align: middle;"/>
											</td>
										</tr>
										<tr>	
											<th scope="row"><span class="essen" title="필수입력">하실말씀</span><span style="display: block;font-size: 12px;color: #b12b1d;padding-top: 8px;padding-left:0;">※글자수 2000자 제한</span></th>
											<td>
												<textarea name="dtlDesc" title="하실말씀" onkeyup="javascript:checkByte();" maxlength="2000"></textarea>
												<div style="text-align:right;"><span id="dtlDescLimit">0</span> / 2,000</div>
											</td>
										</tr>
										<tr id="resind_tr" style="display:none;">	
											<th scope="row"><span class="essen" title="필수입력">회신방법</span></th>
											<td>
												<label><input type="radio" name="resind" id="resind01" value="01" title="회신방법">&nbsp;이메일</label>&nbsp;&nbsp;
												<label><input type="radio" name="resind" id="resind03" value="03" title="회신방법">&nbsp;휴대전화</label>&nbsp;&nbsp;
												<label><input type="radio" name="resind" id="resind04" value="04" title="회신방법">&nbsp;회신거부</label>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
	
							<p class="mt20 taR">
								<a href="javascript:" id="submitLink" class="btnRed">등록</a>
								<a href="javascript:" id="btnCancel" class="btnRed2">취소</a>
								<input type="submit" value="전송" style="display:none;" />
							</p>
						</form>
						
						<script type="text/javascript">
						//<![CDATA[
						 	function checkByte() {
						 		var sText = document.frm.dtlDesc.value;
					            var sTextNoSpace = sText.replace(/ /gi, "").replace(/\s/gi, '').replace(/\r/gi, '').replace(/\n/gi, '');
					            var iLength = sText.length;
					            var iLengthNoSpace = sTextNoSpace.length;
					            var iByte = 0;
					            var iByteNoSpace = 0;

					            iByte = (function (s, b, i, c) {
					                for (b = i = 0; c = s.charCodeAt(i++); b += c >> 11 ? 2 : c >> 7 ? 2 : 1);
					                return b
					            })(sText);
					            
					            if(iLength > 2000){
						            str2 = sText.substr(0, 2000);
						            document.frm.dtlDesc.value = str2;
						            checkByte();
							 	}
					            
					            iLength = iLength.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					            jQuery('#dtlDescLimit').text(iLength);
						    }
						 
						   	jQuery(document).on("keyup",".onlynum",function(){
						   		jQuery(this).val($(this).val().replace(/[^0-9]/gi,""));
							});
							jQuery(document).ready(function(){
								//동의 클릭
								jQuery(".termDiv .check").on("click", function(){
									if(jQuery(this).find("img").attr("src").indexOf("_on.gif") > -1)
									{
										jQuery(this).find("img").attr("src", jQuery(this).find("img").attr("src").replace("_on.gif", ".gif"));
										jQuery("input[name='agreeYn']").val("N");
									}
									else
									{
										jQuery(this).find("img").attr("src", jQuery(this).find("img").attr("src").replace(".gif", "_on.gif"));
										jQuery("input[name='agreeYn']").val("Y");
									}
								});
								
								//달력 세팅
								jQuery.datepicker.setDefaults({
							        dateFormat: 'yy-mm-dd',
							        prevText: '이전 달',
							        nextText: '다음 달',
							        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
							        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
							        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
							        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
							        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
							        showMonthAfterYear: true,
							        yearSuffix: '년'
							    });
								jQuery('#storeDate').datepicker();
								
								jQuery('#ind01').click(function(){
									jQuery('#resind_tr').hide();
									jQuery('#resind01').prop('checked',false).addClass('notRequired');
									jQuery('#resind03').prop('checked',false).addClass('notRequired');
									jQuery('#resind04').prop('checked',false).addClass('notRequired');
								});
								
								jQuery('#ind02').click(function(){
									jQuery('#resind_tr').show();
									jQuery('#resind01').removeClass('notRequired');
									jQuery('#resind03').removeClass('notRequired');
									$('#resind04').removeClass('notRequired');
								});
								
								jQuery('#ind03').click(function(){
									if(confirm('확인을 누르시면 문의 페이지로 이동 합니다')) {
										window.open('/customer-center/personal-counseling/index.do', '_blank');
									}
									jQuery('#ind03').prop('checked',false);
									jQuery('#resind_tr').hide();
									jQuery('#resind01').prop('checked',false).addClass('notRequired');
									jQuery('#resind03').prop('checked',false).addClass('notRequired');
									jQuery('#resind04').prop('checked',false).addClass('notRequired');
								});
								
								jQuery('#moblType01').click(function(){
									jQuery('#moblNo1').show();
									jQuery('#homeNo1').hide();
								});
								
								jQuery('#moblType02').click(function(){
									jQuery('#homeNo1').show();
									jQuery('#moblNo1').hide();
								});
								
								jQuery('#maillist').change(function(){
									document.frm.emailAddr2.value = jQuery(this).val();
								});

								jQuery("select[name='category1']").on("change", function(){
									jQuery("select[name='category2'] option").not(":first").remove();
									
									var category1 = jQuery(this).val();
									
									if(category1 != "") {
										var htmlSrc = "";
										if(category1 == "D1"){
											htmlSrc += "<option value='D1'>가입관련</option>\n";
											htmlSrc += "<option value='D2'>납부관련</option>\n";
											htmlSrc += "<option value='D3'>해약관련</option>\n";
											jQuery("select[name='category2']").append(htmlSrc);
										}
										if(category1 == "D2"){
											htmlSrc += "<option value='D4'>상품관련</option>\n";
											htmlSrc += "<option value='D5'>의전행사</option>\n";
											htmlSrc += "<option value='D6'>하이브리드</option>\n";
											jQuery("select[name='category2']").append(htmlSrc);
										}
										if(category1 == "D3"){
											htmlSrc += "<option value='D7'>리조트</option>\n";
											htmlSrc += "<option value='D8'>부대시설</option>\n";
											htmlSrc += "<option value='D9'>아임레디몰</option>\n";
											jQuery("select[name='category2']").append(htmlSrc);
										}
										if(category1 == "D4"){
											htmlSrc += "<option value='D10'>홈페이지</option>\n";
											htmlSrc += "<option value='D11'>컨택센터</option>\n";
											htmlSrc += "<option value='D12'>기타</option>\n";
											jQuery("select[name='category2']").append(htmlSrc);
										}
									}
								});
								
								
								//등록
								jQuery("#frm").validation({
									msg : {
							            confirm : "등록하시겠습니까?"
							        },
							        customfunc : function(obj, id) {
							        	//동의여부
							        	if("agreeYn" == id)
							        	{
							        		if("Y" != jQuery(obj).val())
							        		{
							        			alert("개인정보 수집 이용 동의를 하셔야 접수가 가능합니다.");
							        			jQuery(".termDiv .check").focus();
							        			return false;
							        		}
							        	}
							        },
							        loadingbar : {
										use : true
									}
								});
								
								jQuery("#submitLink").on("click", function(e){
									//기본이벤트 제거
									e.preventDefault();

									jQuery("input[type='submit']").trigger("click");
								});
								
								//취소
								jQuery("#btnCancel").on("click", function(){
									if(confirm("취소할 경우 작성한 글은 모두 삭제됩니다.\n취소하시겠습니까?"))
									{
										window.location.reload();
									}
								});
							});

						//]]>
						</script>