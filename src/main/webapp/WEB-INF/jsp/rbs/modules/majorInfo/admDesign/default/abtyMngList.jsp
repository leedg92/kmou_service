<%@ include file="../../../../include/commonTop.jsp"%>
<%@ taglib prefix="elui" uri="/WEB-INF/tlds/el-tag.tld"%>
<%@ taglib prefix="itui" tagdir="/WEB-INF/tags/item"%>
<%@ taglib prefix="pgui" tagdir="/WEB-INF/tags/pagination"%>
<c:set var="mngAuth" value="${elfn:isAuth('MNG')}" />
<c:set var="searchFormId" value="fn_codeMstrSearchForm" />
<c:set var="listFormId" value="fn_codeMstrListForm" />
<c:set var="inputFormId" value="fn-abtyRegi-submit" />

<c:set var="headTitle" value="전공능력 관리" />

<c:if test="${!empty TOP_PAGE}">
	<jsp:include page="${TOP_PAGE}" flush="false">
		<jsp:param name="page_tit" value="${headTitle }" />
		<jsp:param name="javascript_page"
			value="${moduleJspRPath}/abtyMngList.jsp" />
		<jsp:param name="searchFormId" value="${searchFormId}" />
		<jsp:param name="listFormId" value="${listFormId}" />
	</jsp:include>
</c:if>
<div id="cms_board_article">

	<div class="tbMSearch">
		<form name="${searchFormId}" id="${searchFormId}" method="get"
			action="<c:out value="${URL_ADD_MAJOR}"/>">
			<input type="hidden" name="mId" value="${queryString.mId}"> <input
				type="hidden" name="majorIdx" value="${queryString.majorIdx}">
			<input type="hidden" name="yearIdx" value="${queryString.yearIdx}">
			<fieldset id="topfieldset">
				<dl>
					<select name="is_sptPsnKor" id="s_sptPsnKor" class="select"
						title="인재상">
						<option value="">전체</option>
					</select>
					<input placeHolder="교과명을 입력해 주세요" type="text" value=""
						title="sbjtKorNm" name="sbjtKorNm"></input>
					<input type="submit" id="fn_btn_search" class="btnTypeL"
						value="검색" title="검색"></input>
					
				</dl>

			</fieldset>

		</form>
	</div>
	
	<a href="<c:out value="${URL_ABTY_MNG_DEL_PROC}"/>" title="삭제" class="btnTD fn_btn_delete">삭제</a>
	<a href="#" id="open-modal01" title="등록" class="btnTW fn_btn_write${inputWinFlag}">등록</a>
	
	<form id="${listFormId}" name="${listFormId}" method="post"
		target="list_target">
		<div style="padding-right:0.5%;">
		<table id="tpSubContent" class="tbListA"
			summary="<c:out value="${settingInfo.list_title}"/> 목록을 볼 수 있고 수정 링크를 통해서 수정페이지로 이동합니다.">
			<caption>
				<c:out value="${settingInfo.list_title}" />
				목록
			</caption>
			<colgroup>
				<col width="5%" />
				<col width="5%" />
				<col width="10%" />
				<col width="15%" />
				<col />
				<col width="5%" />
			</colgroup>
			<thead>
				<tr>
					<c:if test="${isMajorInfo ne 'Y'}">
						<th scope="col"><c:if test="${mngAuth}">
								<input type="checkbox" id="selectAll" name="selectAll"
									title="<spring:message code="item.select.all"/>" />
							</c:if></th>
					</c:if>
					<th scope="col">No</th>
					<th scope="col">관리</th>
					<th scope="col">전공능력명</th>
					<th scope="col">전공능력 정의</th>
					<th scope="col">상위능력</th>
					<!-- 마지막 th에 class="end" -->
				</tr>
			</thead>
		</table>
		</div>
		<div class="scrollable-tbody">
			<table id="tpSubContent" class="tbListA"
				summary="<c:out value="${settingInfo.list_title}"/> 목록을 볼 수 있고 수정 링크를 통해서 수정페이지로 이동합니다.">
				<colgroup>
					<col width="5%" />
					<col width="5%" />
					<col width="10%" />
					<col width="15%" />
					<col />
					<col width="5%" />
				</colgroup>
				
				<tbody class="alignC">
					<c:if test="${empty abtyList}">
						<tr>
							<td colspan="5" class="bllist"><spring:message
									code="message.no.list" /></td>
						</tr>
					</c:if>
					<c:set var="listIdxName" value="${settingInfo.idx_name}" />
					<c:set var="listNo" value="${paginationInfo.firstRecordIndex + 1}" />
					<c:forEach var="listDt" items="${abtyList}" varStatus="i">
						<tr>

							<td><c:if test="${mngAuth}">
									<input type="checkbox" id="select" name="select"
										title="<spring:message code="item.select"/>"
										value="${listDt.ABTY_CD}" />
								</c:if></td>
							<td class="num">${listNo}</td>
							<td><a href="#" class="btnTypeF fn_btn_modify open-modal02" data-value="${listDt.ABTY_CD}" data-major="${listDt.MAJOR_ABTY}" data-defn="${listDt.MAJOR_ABTY_DEFN}" data-parent="${listDt.PARENT_ABTY_NM}">수정</a></td>
							<td>${listDt.MAJOR_ABTY}</td>
							<td>${listDt.MAJOR_ABTY_DEFN}</td>
							<td>${listDt.PARENT_ABTY_NM }</td>


							<input type="hidden" name="YY" +${i.index} value="${listDt.YY}"></input>
							<input type="hidden" name="OPEN_SUST_MJ_CD" +${i.index}
								value="${listDt.OPEN_SUST_MJ_CD}"></input>
							<input type="hidden" name="SHTM_CD" +${i.index}
								value="${listDt.SHTM_CD}"></input>
							<input type="hidden" name="SHTM_NM" +${i.index}
								value="${listDt.SHTM_NM}"></input>
							<input type="hidden" name="COURSE_NO" +${i.index}
								value="${listDt.COURSE_NO}"></input>
							<input type="hidden" name="OPEN_SHYR_FG" +${i.index}
								value="${listDt.OPEN_SHYR_FG}"></input>
							<input type="hidden" name="SHYR_NM" +${i.index}
								value="${listDt.SHYR_NM}"></input>
							<input type="hidden" name="SBJT_KOR_NM" +${i.index}
								value="${listDt.SBJT_KOR_NM}"></input>
							<input type="hidden" name="SBJT_ENG_NM" +${i.index}
								value="${listDt.SBJT_ENG_NM}"></input>
							<input type="hidden" name="SBJT_FG" +${i.index}
								value="${listDt.SBJT_FG}"></input>
							<input type="hidden" name="SBJT_NM" +${i.index}
								value="${listDt.SBJT_NM}"></input>
								
							<input type="hidden" name="PNT" +${i.index}
							value="${listDt.PNT}"></input>
							<input type="hidden" name="THEO_TM_CNT" +${i.index}
							value="${listDt.THEO_TM_CNT}"></input>
							<input type="hidden" name="PRAC_TM_CNT" +${i.index}
							value="${listDt.PRAC_TM_CNT}"></input>

						</tr>
						<c:set var="listNo" value="${listNo + 1}" />
					</c:forEach>
				</tbody>
			</table>
		</div>
	</form>

</div>

<div class="btnCenter">
	<!-- <input type="submit" id="saveSub" class="btnTypeA fn_btn_submit" value="교과목 추가" title="교과목 추가" /> --> 
		<a href="javascript:self.close();" title="닫기" class="btnTypeB back_to_list"> 닫기 </a>
</div>

<!-- 일괄 변경 모달창 -->
	<div class="mask"></div>
	
	<form id="${inputFormId}" name="${inputFormId}" method="post" action="<c:out value="${URL_ABTY_MNG_INPUT_PROC}"/>" target="submit_target" enctype="multipart/form-data">
	<input type="hidden" name="majorCd" value="${param.majorCd }">
	<input type="hidden" id="modi" name="modi" value="">
	<input type="hidden" id="abtyCd" name="abtyCd" value="">
	<!-- <div class="modal fade modal-xl modal_syllabus" id="addModal" tabindex="-1" aria-labelledby="syllabusModalLabel" aria-hidden="true"> -->
	<div class="modal-wrapper" id="modal-action01" >
		<h2>전공능력 등록</h2>
		<div class="modal-area">
			<div id="overlay"></div>
			<div class="loader"></div>
			<div class="contents-box pl0">
				<div class="basic-search-wrapper">
					<div class="one-box">
						<dl>
							<dt>능력 명</dt>
							<dd>
						    	<input name="majorAbty" id="majorAbty" class="inputTxt" title="능력 명" style="width: 100%;height: 100%;border: 1px solid #dbdbdb;">	 	
							</dd>
						</dl>
					</div>
					<div class="one-box">
						<dl>
							<dt>능력 정의</dt>
							<dd>
								<textarea placeholder="능력 정의" class="inputTxt" name="majorAbtyDefn" id="majorAbtyDefn" style="width: 100%;height: 100%;border: 1px solid #dbdbdb;"></textarea>
							</dd>
						</dl>
					</div>
					<div class="one-box">
						<dl>
							<dt>상위전공능력</dt>
							<dd>
						    	<select class="select" name="parentAbty" id="parentAbty" title="상위전공능력" style="width: 100%;height: 100%;border: 1px solid #dbdbdb;">							
									<option value="">상위 전공능력 지정</option>
								</select>	 	
							</dd>
						</dl>
					</div>
					<div class="btns-area">
						<button type="button" class="btn-m02 btn-color02 round01 fn-abtyRegi-submit">저장</button>
						<button type="button" class="btn-m02 btn-color02 round01 fn-abtyRegi-cancel">취소</button>
					</div>
				</div>
			</div>
		</div>
		<button type="button" class="btn-modal-close">모달 창 닫기</button>
	</div>
	</form>

<style>.modal-wrapper {
    position: fixed;
    top: 50%;
    left: 50%;
    display: none;
    width: 600px;
    margin-left: -300px;
    background-color: #fff;
    box-shadow: 0px 5px 5px 0px rgba(0, 0, 0, 0.15);
    z-index: 1010;
    transform: translate(0, -50%);
}</style>
<c:if test="${!empty BOTTOM_PAGE}"><jsp:include
		page="${BOTTOM_PAGE}" flush="false" /></c:if>