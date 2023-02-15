<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>
<c:if test="${not empty cashShoppingHistory}">
    <span class="red">
        레디캐시 사용 내역
    </span>
    <table class="type1" summary="">
        <input type="hidden" name="accntNo" value="${accntNo}" />
        <input type="hidden" name="resnAmt" value="${resnAmt}" />
        <%--<input type="hidden" name="pageNum" value="${paginationInfo.currentPageNo}" />--%>
        <colgroup>
            <col width="33%" />
            <col width="33%" />
            <col width="34%" />
        </colgroup>
        <thead>
        <tr>
            <th>사용</th>
            <th>구분</th>
            <th>사용금액</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="cashShoppingHistory" items="${cashShoppingHistory}" varStatus="status">
            <tr class="historyTr ${status.count > 10 ? 'hidden' : ''}">
                <td>${egov:convertDate(cashShoppingHistory.createDate, 'yyyy-MM-dd HH:mm:ss', 'yyyy-MM-dd', '')}</td>
                <td>${cashShoppingHistory.type}</td>
                <td><fmt:formatNumber value="${cashShoppingHistory.amt}" type="number" maxFractionDigits="0" /></td>
            </tr>
        </c:forEach>
        <c:if test="${cashShoppingHistory[0].totCnt > 10}">
            <tr class="moreTr">
                <td colspan="3" onClick="javascript:onClickMoreBtn(this);">더보기</td>
            </tr>
        </c:if>
        </tbody>
    </table>
    <%--<div class="paging mt30">--%>
        <%--<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="getRefundPtcHistoryList" />--%>

            <%--<a href="javascript:" onclick="return false;" class="fir" title="처음"><img src="/common/images/btn/pagin_fir.gif" alt=""></a>--%>
            <%--<a href="javascript:" onclick="return false;" class="prv" title="이전"><img src="/common/images/btn/pagin_prv.gif" alt=""></a>--%>
            <%----%>
            <%--<a href="javascript:" onclick="return false;" class="nxt" title="다음"><img src="/common/images/btn/pagin_end.gif" alt=""></a>--%>
            <%--<a href="javascript:" onclick="return false;" class="end" title="끝"><img src="/common/images/btn/pagin_nxt.gif" alt=""></a>--%>
    <%--</div>--%>
    <table class="type1" summary="">
        <colgroup>
            <col width="30%" />
            <col width="70%" />
        </colgroup>
        <tbody>
        <tr>
            <th>환급금액</th>
            <td><fmt:formatNumber value="${cashShoppingAmt}" type="number" maxFractionDigits="0" /></td>
        </tr>
        </tbody>
    </table>
</c:if>