<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>

<table class="type1" summary="">
    <caption></caption>
    <colgroup>
        <col width="5%" />
        <col width="10%" />
        <col width="10%" />
        <col width="25%" />
        <col width="10%" />
        <col width="10%" />
<%--        <col width="5%" />--%>
<%--        <col width="10%" />--%>
    </colgroup>
    <tbody>
    <tr>
        <th style="text-align: center">No.</th>
<%--        <th style="text-align: center">회원명</th>--%>
<%--        <th style="text-align: center">휴대전화</th>--%>
        <th style="text-align: center">렌탈접수번호</th>
        <th style="text-align: center">가입상품</th>
        <th style="text-align: center">등록일자</th>
        <th style="text-align: center">가입일자</th>
        <th style="text-align: center">가입상태</th>
<%--        <th style="text-align: center">수당</th>--%>
    </tr>
    <c:set var="sum" value="0" />
    <c:choose>
        <c:when test="${not empty emfMap.record}">
            <c:forEach items="${emfMap.record}" var="record" varStatus="status">
                <tr>
                    <td>${emfMap.totalCount - status.index}</td>
<%--                    <td>${record.memNm}</td>--%>
<%--                    <td>${record.cell}</td>--%>
                    <td>${record.accntNo}</td>
                    <td>${record.prodNm}</td>
                    <td>${record.regDm}</td>
                    <td>${egov:convertDate(record.joinDt, 'yyyyMMdd', 'yyyy-MM-dd', '')}</td>
                    <td>${record.accStat}</td>
<%--                    <td>${record.ccAlow}</td>--%>
<%--                        <c:if test="${record.accStat ne '해약'}">--%>
<%--                            <c:set var="sum" value="${sum + (record.ccAlow eq null ? 0 : record.ccAlow)}" />--%>
<%--                        </c:if>--%>
<%--                        <fmt:formatNumber value="${(record.ccAlow eq null) ? 0 : record.ccAlow}" type="currency" />--%>
<%--                    </td>--%>
                </tr>
            </c:forEach>
<%--            <tr>--%>
<%--                <td colspan="7">수당 합계</td>--%>
<%--                <td colspan="3">--%>
<%--                    <fmt:formatNumber value="${sum}" type="currency" />--%>
<%--                </td>--%>
<%--            </tr>--%>
        </c:when>
        <c:otherwise>
            <tr>
                <td colspan="10">
                    조회 결과가 없습니다.
                </td>
            </tr>
        </c:otherwise>
    </c:choose>

    </tbody>
</table>

<%--
<div class="paging mt30">
    <c:choose>
        <c:when test="${not empty emfMap.record}">
            <ui:pagination paginationInfo="${emfMap.paginationInfo}" type="image" jsFunction="callApi" />
        </c:when>
    </c:choose>
</div>
--%>

<%--<div style="margin-top: 100px;">--%>
<%--    <b>[주요 안내사항]</b> <br />--%>
<%--    - 웹 접수 시 최초 1회 본인인증한 C.I값과 삼성선불카드 발급 시 인증한 C.I값이 다를 경우 시책금이 정상적으로 지급되지 않을 수 있습니다. (웹 접수 시 인증한 C.I값으로 시책금 지급)<br />--%>
<%--    - 등록일자란 TM 녹취 가입일, 가입일자란 1회차 출금일을 의미합니다.<br />--%>
<%--    - 웹 접수 신청 후 정상적으로 TM 녹취 가입이 이루어지면 등록일자가 생성됩니다.<br />--%>
<%--    - TM 녹취 가입(등록) 후 익월까지 출금(가입) 시 익익월 시책금이 지급됩니다.<br />--%>
<%--    - 지급 기준 이내에 회원이 청약철회 시 시책금이 지급되지 않습니다.<br />--%>
<%--    - 지급 기준 이후 회원이 1회차 출금 시 시책금이 지급되지 않습니다. (ex : 1월 등록 3월 출금 시책금 지급 불가)<br />--%>
<%--    - 웹 접수 신청 후 3개월 이후 TM 녹취 미가입 고객은 DB가 삭제되어 해당 페이지에서 조회가 불가능합니다.(웹 접수 재신청)<br />--%>
<%--    - 회원의 가입상태는 청약철회, 해약 등에 따라 실시간으로 변경될 수 있습니다.<br />--%>
<%--    - 연체, 행사 등 시책금 조회와 관계 없는 회원 가입상태는 공란으로 처리됩니다.<br />--%>
<%--    - 지급여부 및 지급일자는 삼성카드 2차 개발 이후 확인하실 수 있습니다.(일정 추후 공지)<br />--%>
<%--    <b>- 본 페이지에서 조회되는 시책금은 예상 금액이며, 기준에 따라 삼성카드 실제 지급 금액은 차이가 날 수 있습니다.</b><br />--%>
<%--    - 회원 조회 관련 문의 : 대명아임레디 컨택센터(1588-8511)<br />--%>
<%--    - 시책 지급 관련 문의 : 삼성카드 컨택센터(1588-8700)--%>
<%--</div>--%>