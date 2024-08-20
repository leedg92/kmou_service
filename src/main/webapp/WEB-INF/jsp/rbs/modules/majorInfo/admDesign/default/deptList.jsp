<%@ include file="../../../../include/commonTop.jsp"%>
<%-- <%@ include file="../../../../include/commonEnc.jsp"%> --%>
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
	<!-- search -->
	<c:if test="${userTypeIdx ne '45' && userTypeIdx ne '46'}">
	<div class="tbMSearch">
		<form name="${searchFormId}" id="${searchFormId}" method="get"  action="<c:out value="${URL_DEFAULT_LIST}"/>">
			<input type="hidden" name="mId" value="${queryString.mId}">
			<fieldset>				
				<dl>
					<dt>소속 </dt>
					<dd style="width:50%">
						<select name="is_colgCd" id="s_colgCd" class="select" title="대학" >
							<option value="">전체</option>
						</select>
						<select name="is_fcltSustCd" id="s_fcltSustCd" class="select" title="학부/학과" >
							<option value="">전체</option>
						</select>
						<select name="is_mjCd" id="s_mjCd" class="select" title="전공">
							<option value="">전체</option>
						</select>
					</dd>
					<itui:searchFormItemIn itemListSearch="${itemInfo.list_search}" searchOptnHashMap="${searchOptnHashMap}" isUseRadio="${isUseRadio}" isUseMoreItem="${isUseMoreItem}"/>	
				</dl>
			</fieldset>
			<p style="padding-bottom: 15px;">
				<input type="submit" id="fn_btn_search" class="btnSearch" value="검색" title="검색">
			</p>
		</form>
	</div>		
	</c:if>
	<!-- //search -->
		
	<div class="btnTopFull">
		<div class="right"><a class="btnTFW fn_btn_write" href="<c:out value="${URL_INPUT}"/>" title="추가" class="btnTW fn_btn_write${inputWinFlag}">등록</a></div>
	</div>
	
	<form id="${listFormId}" name="${listFormId}" method="post" action="${URL_INPUT}&mode=m" target="list_target">
		<table class="tbListA" summary="<c:out value="${settingInfo.list_title}"/> 목록을 볼 수 있고 수정 링크를 통해서 수정페이지로 이동합니다.">
			<caption><c:out value="${settingInfo.list_title}"/> 목록</caption>
			<colgroup>
				<col width="80px" />
				<col width="80px" />
				<col width="200px" />
				<col width="80px" />
				<col width="80px" />
				<col width="100px" />
			</colgroup>
			<thead>
			<tr>
				<th scope="col">No</th>
				<th scope="col">부서레벨</th>
				<th scope="col">소속</th>
				<th scope="col">사용유무</th>
				<th scope="col">부서관리</th>
				<th scope="col">최근 업데이트</th>
			</tr>
			</thead>
			<tbody class="alignC">
				<c:if test="${empty list}">
				<tr>
					<td colspan="5" class="bllist"><spring:message code="message.no.list"/></td>
				</tr>
				</c:if>
				<c:set var="listDeptName" value="DEPT_CD"/>				
				<c:set var="listNo" value="${paginationInfo.firstRecordIndex + 1}" />
				<c:forEach var="listDt" items="${list}" varStatus="i">
				<tr>
					<td class="num">${listNo}</td>
					<td>
						<c:choose>
							<c:when test="${listDt.DEPT_LEVEL == '2' }">대학</c:when>
							<c:when test="${listDt.DEPT_LEVEL == '3' }">학부/학과</c:when>
							<c:when test="${listDt.DEPT_LEVEL == '4' }">전공</c:when>
							<c:otherwise>-</c:otherwise>
						</c:choose>
					</td>
					<td>
					<c:if test="${mngAuth || wrtAuth && listDt.AUTH_MNG == '1'}">
						<c:choose>
							<c:when test="${listDt.DEPT_LEVEL == '2' }"><c:out value="${listDt.DEPT_NM}"/></c:when>
							<c:when test="${listDt.DEPT_LEVEL == '3' }"><c:out value="${listDt.COLG_NM}"/> > <c:out value="${listDt.DEPT_NM}"/></c:when>
							<c:when test="${listDt.DEPT_LEVEL == '4' }"><c:out value="${listDt.COLG_NM}"/> > <c:out value="${listDt.UP_NM}"/> > <c:out value="${listDt.DEPT_NM}"/></c:when>
							<c:otherwise>-</c:otherwise>
						</c:choose>
					</c:if>
					</td>
					<td class="num">
						<c:choose>
							<c:when test="${listDt.ISDELETE == '0' }">사용</c:when>
							<c:otherwise>미사용</c:otherwise>
						</c:choose>
					</td>
					<td class="num">
						<a href="javascript:void(0)" onclick='location.href="<c:out value="${URL_MODIFY}"/>&${listDeptName}=${listDt.DEPT_CD}"' class="btnTypeF fn_btn_modify">수정</a>
					</td>
					<td class="date"><fmt:formatDate pattern="yyyy-MM-dd" value="${listDt.LAST_MODI_DATE}"/></td>
				</tr>
				<c:set var="listNo" value="${listNo + 1}"/>
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