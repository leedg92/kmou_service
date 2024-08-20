<%@ include file="../../../../include/commonTop.jsp"%>
<link rel="stylesheet" type="text/css" href ="../../../css/majorInfo.css"/>
<%@ taglib prefix="itui" tagdir="/WEB-INF/tags/item" %>
<%@ taglib prefix="pgui" tagdir="/WEB-INF/tags/pagination" %>
<c:set var="mngAuth" value="${elfn:isAuth('MNG')}"/>
<c:set var="searchFormId" value="fn_techSupportSearchForm"/>
<c:set var="listFormId" value="fn_techSupportListForm"/>
<c:set var="inputWinFlag" value=""/><%/* 등록/수정창 새창으로 띄울 경우 사용 */%>
<c:set var="btnModifyClass" value="fn_btn_modify${inputWinFlag}"/><%/* 수정버튼 class */%>
<c:if test="${!empty TOP_PAGE}">
	<jsp:include page="${TOP_PAGE}" flush="false">
		<jsp:param name="javascript_page" value="${moduleJspRPath}/list.jsp"/>
		<jsp:param name="searchFormId" value="${searchFormId}"/>
		<jsp:param name="listFormId" value="${listFormId}"/>
	</jsp:include>
</c:if>
	<div id="cms_board_article">
		<jsp:include page="common/tabList.jsp" flush="false">
			<jsp:param name="tab" value="2"/>
			<jsp:param name="dt" value="fromList"/>
		</jsp:include>
		
		<!-- //search -->
		
		<!-- button -->
<!-- 		<div class="btnTopFull"> -->
<%-- 			<c:set var="input_dialog_height" value="670"/> --%>
<%-- 			<%@ include file="../../../../adm/include/module/listBtns.jsp"%> --%>
<!-- 		</div> -->
		
		<div class="registWrap"><a class="btnRegist" href="<c:out value="${URL_TRACK_INPUT}"/>" title="추가" class="btnTW fn_btn_write${inputWinFlag}">추가</a></div>
		<!-- //button -->
		<form id="${listFormId}" name="${listFormId}" method="post" target="list_target">
		<table class="tbListA" summary="<c:out value="${settingInfo.list_title}"/> 목록을 볼 수 있고 수정 링크를 통해서 수정페이지로 이동합니다.">
			<caption><c:out value="${settingInfo.list_title}"/> 목록</caption>
			<colgroup>
				<col width="50px" />
				<col width="60px" />
				<col width="260px" />
				<col width="260px" />
				<col width="150px" />
				<col width="350px" />
				<col width="100px" />
				<col width="100px" />
			</colgroup>
			<thead>
			<tr>
<%-- 				<th scope="col"><input type="checkbox" id="selectAll" name="selectAll" title="<spring:message code="item.select.all"/>"/></th> --%>
				<th scope="col">No</th>
				<th scope="col">수정</th>
				<th scope="col">학과전공명</th>
				<th scope="col">학년</th>
				<th scope="col">전문인</th>
				<th scope="col">과목명</th>
				<th scope="col">수정자</th>
				<th scope="col">최근 업데이트</th>
<%-- 				<th scope="col"><itui:objectItemName itemId="sampleItemId" itemInfo="${itemInfo}"/></th> --%>
<%-- 				<th scope="col"><spring:message code="item.regidate.name"/></th> --%>
			</tr>
			</thead>
			<tbody class="alignC">
				<c:if test="${empty list}">
				<tr>
					<td colspan="6" class="bllist"><spring:message code="message.no.list"/></td>
				</tr>
				</c:if>
				<c:set var="listMajorIdxName" value="${settingInfo.idx_major_name}"/>
				<c:set var="listYearIdxName" value="${settingInfo.idx_year_name}"/>
				<c:set var="listSptPsnIdxName" value="${settingInfo.idx_spt_psn_kor}"/>
				<c:set var="listNo" value="${paginationInfo.totalRecordCount - paginationInfo.firstRecordIndex}" />
				<c:forEach var="listDt" items="${list}" varStatus="i">
				<tr>
<%-- 					<td><c:if test="${mngAuth || wrtAuth && listDt.AUTH_MNG == '1'}"><input type="checkbox" id="select" name="select" title="<spring:message code="item.select"/>" value="${listKey}"/></c:if></td> --%>
					<td class="num">${listNo}</td>
					<td><a href="<c:out value="${URL_TRACK_INPUT}"/>&mode=m&${listMajorIdxName}=${listDt.MAJOR_IDX}&${listYearIdxName}=${listDt.YEAR_IDX}&${listSptPsnIdxName}=${listDt.SPT_PSN_KOR}" >수정</a></td>
					<td><itui:objectView itemId="deptNm" itemInfo="${itemInfo}" objDt="${listDt}"/></td>
					<td><itui:objectView itemId="shyr" itemInfo="${itemInfo}" objDt="${listDt}"/></td>
					<td><itui:objectView itemId="sptPsnKor" itemInfo="${itemInfo}" objDt="${listDt}"/></td>
					<td><itui:objectView itemId="subjectNm" itemInfo="${itemInfo}" objDt="${listDt}"/></td>					
					<td><p>${listDt.LAST_MODI_NAME}</p></td>
					<td class="date"><fmt:formatDate pattern="yyyy-MM-dd" value="${listDt.LAST_MODI_DATE}"/></td>
				</tr>
				<c:set var="listNo" value="${listNo - 1}"/>
				</c:forEach>
			</tbody>
		</table>
		</form>
		
		<!-- paging -->
		<div class="paginate mgt15">
			<pgui:pagination listUrl="${URL_PAGE_LIST}" pgInfo="${paginationInfo}" imgPath="${imgPath}" pageName="${elfn:getString(settingInfo.page_name, 'page')}"/>
		</div>
		<!-- //paging -->
	</div>
	<div id="footerWrap" style="bottom:auto; width:93%">
		<div id="footer">
			<p class="copyright"><c:out value="${siteInfo.site_copyright}"/></p>
		</div>
	</div>
<%-- <c:if test="${!empty BOTTOM_PAGE}"><jsp:include page="${BOTTOM_PAGE}" flush="false"/></c:if> --%>