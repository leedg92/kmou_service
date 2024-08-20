<%@ include file="../../../../include/commonTop.jsp"%>
<%@ taglib prefix="elui" uri="/WEB-INF/tlds/el-tag.tld"%>
<%@ taglib prefix="itui" tagdir="/WEB-INF/tags/item"%>
<%@ taglib prefix="pgui" tagdir="/WEB-INF/tags/pagination"%>
<c:set var="mngAuth" value="${elfn:isAuth('MNG')}" />
<c:set var="searchFormId" value="fn_codeMstrSearchForm" />
<c:set var="listFormId" value="fn_codeMstrListForm" />

<c:set var="headTitle" value="교과목 등록" />

<c:if test="${!empty TOP_PAGE}">
	<jsp:include page="${TOP_PAGE}" flush="false">
		<jsp:param name="page_tit" value="${headTitle }" />
		<jsp:param name="javascript_page"
			value="${moduleJspRPath}/addMajorInput.jsp" />
		<jsp:param name="searchFormId" value="${searchFormId}" />
		<jsp:param name="listFormId" value="${listFormId}" />
	</jsp:include>
</c:if>
<div id="cms_board_article">

	<div class="plan_admin">
		<div class="plan_admin_L">
			<div class="bx_top">
				<form name="${searchFormId}" id="${searchFormId}" method="get" action="<c:out value="${URL_ADD_MAJOR}"/>">
					<input type="hidden" name="mId" value="${queryString.mId}">
					<input type="hidden" name="majorIdx" value="${queryString.majorIdx}">
					<input type="hidden" name="yearIdx" value="${queryString.yearIdx}">
					<fieldset id="topfieldset">
						<select name="field" id="s_field" class="select" title="진출분야">
							<option value="">전체</option>
						</select>
						<input placeHolder="교과명을 입력해 주세요" type="text" value="" title="sbjtNm" name="sbjtNm"></input>
						<input type="submit" id="fn_btn_search" class="btnTypeL" value="검색" title="검색"></input>
					</fieldset>
				</form>
			</div>
			<div class="bx_content">
				<div class="title">
					<h5>검색된 항목</h5>
					<ul>
						<li><button class="">전체추가</button></li>
					</ul>
				</div>
				<div class="planad_content">
					<div class="plan_bx">
						<!-- 교과목선택 리스트 시작 -->
						<div class="plan_list">
							<ul>
								<li class="title"><span>1</span>해양문화분석능력</li>
								<li>
									<dl>
										<dt>전공능력명</dt>
										<dd>21세기 세계의 변화에 적극적으로 대처하는 해양문화분석능력</dd>
									</dl>
									<dl>
										<dt>상위능력명</dt>
										<dd>-</dd>
									</dl>
								</li>
							</ul>
							<div>
								<button class="btn_st1">수정</button>
								<button class="btn_st2">선택</button>
							</div>
						</div>
						
						<!-- div class="plan_list noitem">
							<p>교과목을 검색해주세요.</p>
						</div -->
						<!-- //교과목선택 리스트 끝 -->
					</div>
				</div>
			
				<div class="paginate mgt15">
					<li class="page-item active"><a class="page-link" href="list.do?mId=40&amp;page=1" title="1 페이지">1</a></li>
				</div>
			</div>
		</div>
		<div class="plan_admin_C"></div>
		<div class="plan_admin_R">
			<div class="bx_content">
				<div class="title">
					<h5>선택된 항목</h5>
					<ul>
						<li><button class="btn_st1">선택삭제</button></li>
						<li><button>비우기</button></li>
					</ul>
				</div>
				<div class="planad_content">
					<div class="plan_bx">
						<!-- 교과목선택 리스트 시작 -->
						<div class="plan_list">
							<ul>
								<li class="title"><span><input type="checkbox" id="select" name="select" title="선택" value=""></span>해양문화분석능력</li>
								<li>
									<dl>
										<dt>전공능력명</dt>
										<dd>21세기 세계의 변화에 적극적으로 대처하는 해양문화분석능력</dd>
									</dl>
									<dl>
										<dt>상위능력명</dt>
										<dd>-</dd>
									</dl>
								</li>
							</ul>
							<div>
								<button>삭제</button>
							</div>
						</div>
						
						<div class="plan_list">
							<ul>
								<li class="title"><span><input type="checkbox" id="select" name="select" title="선택" value=""></span>해양문화분석능력</li>
								<li>
									<dl>
										<dt>전공능력명</dt>
										<dd>21세기 세계의 변화에 적극적으로 대처하는 해양문화분석능력</dd>
									</dl>
									<dl>
										<dt>상위능력명</dt>
										<dd>-</dd>
									</dl>
								</li>
							</ul>
							<div>
								<button>삭제</button>
							</div>
						</div>
						
						<div class="plan_list">
							<ul>
								<li class="title"><span><input type="checkbox" id="select" name="select" title="선택" value=""></span>해양문화분석능력</li>
								<li>
									<dl>
										<dt>전공능력명</dt>
										<dd>21세기 세계의 변화에 적극적으로 대처하는 해양문화분석능력</dd>
									</dl>
									<dl>
										<dt>상위능력명</dt>
										<dd>-</dd>
									</dl>
								</li>
							</ul>
							<div>
								<button>삭제</button>
							</div>
						</div>
						
						<div class="plan_list">
							<ul>
								<li class="title"><span><input type="checkbox" id="select" name="select" title="선택" value=""></span>해양문화분석능력</li>
								<li>
									<dl>
										<dt>전공능력명</dt>
										<dd>21세기 세계의 변화에 적극적으로 대처하는 해양문화분석능력</dd>
									</dl>
									<dl>
										<dt>상위능력명</dt>
										<dd>-</dd>
									</dl>
								</li>
							</ul>
							<div>
								<button>삭제</button>
							</div>
						</div>
						
						<div class="plan_list">
							<ul>
								<li class="title"><span><input type="checkbox" id="select" name="select" title="선택" value=""></span>해양문화분석능력</li>
								<li>
									<dl>
										<dt>전공능력명</dt>
										<dd>21세기 세계의 변화에 적극적으로 대처하는 해양문화분석능력</dd>
									</dl>
									<dl>
										<dt>상위능력명</dt>
										<dd>-</dd>
									</dl>
								</li>
							</ul>
							<div>
								<button>삭제</button>
							</div>
						</div>
						
						<div class="plan_list">
							<ul>
								<li class="title"><span><input type="checkbox" id="select" name="select" title="선택" value=""></span>해양문화분석능력</li>
								<li>
									<dl>
										<dt>전공능력명</dt>
										<dd>21세기 세계의 변화에 적극적으로 대처하는 해양문화분석능력</dd>
									</dl>
									<dl>
										<dt>상위능력명</dt>
										<dd>-</dd>
									</dl>
								</li>
							</ul>
							<div>
								<button>삭제</button>
							</div>
						</div>
						
						<div class="plan_list">
							<ul>
								<li class="title"><span><input type="checkbox" id="select" name="select" title="선택" value=""></span>해양문화분석능력</li>
								<li>
									<dl>
										<dt>전공능력명</dt>
										<dd>21세기 세계의 변화에 적극적으로 대처하는 해양문화분석능력</dd>
									</dl>
									<dl>
										<dt>상위능력명</dt>
										<dd>-</dd>
									</dl>
								</li>
							</ul>
							<div>
								<button>삭제</button>
							</div>
						</div>
						
						<div class="plan_list">
							<ul>
								<li class="title"><span><input type="checkbox" id="select" name="select" title="선택" value=""></span>해양문화분석능력</li>
								<li>
									<dl>
										<dt>전공능력명</dt>
										<dd>21세기 세계의 변화에 적극적으로 대처하는 해양문화분석능력</dd>
									</dl>
									<dl>
										<dt>상위능력명</dt>
										<dd>-</dd>
									</dl>
								</li>
							</ul>
							<div>
								<button>삭제</button>
							</div>
						</div>
						
						<!-- div class="plan_list noitem">
							<p>교과목을 추가해주세요.</p>
						</div -->
						<!-- //교과목선택 리스트 끝 -->
					</div>
				</div>
				
				<div class="planad_btnbx">
					<input type="submit" id="saveSub" class="btnTypeA fn_btn_submit" value="교과목 추가" title="교과목 추가" />
				</div> 
			</div>
		</div>
	</div>
		
	<div class="tbMSearch">
		
	</div>

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
				<col width="15%" />
				<col width="15%" />
				<col width="15%" />
				<col />
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
					<th scope="col">교과구분</th>
					<th scope="col">개설학년</th>
					<th scope="col">학기구분</th>
					<th scope="col">학수번호</th>
					<th scope="col">과목명</th>


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
					<col width="15%" />
					<col width="15%" />
					<col width="15%" />
					<col />
				</colgroup>
				
				<tbody class="alignC">
					<c:if test="${empty addMajorList}">
						<tr>
							<td colspan="7" class="bllist"><spring:message
									code="message.no.list" /></td>
						</tr>
					</c:if>
					<c:set var="listIdxName" value="${settingInfo.idx_name}" />
					<c:set var="listNo" value="${paginationInfo.firstRecordIndex + 1}" />
					<c:forEach var="listDt" items="${addMajorList}" varStatus="i">
						<tr>

							<td><c:if test="${mngAuth}">
									<input type="checkbox" id="select" name="select"
										title="<spring:message code="item.select"/>"
										value="${listKey}" />
								</c:if></td>
							<td class="num">${listNo}</td>
							<td value="${listDt.COMDIV_CODE}">${listDt.COMDIV_CODE_NM}</td>
							<td>${listDt.COM_GRADE}</td>
							<td>${listDt.SMT_NM}</td>
							<td>${listDt.SUBJECT_CD}</td>
							<td>${listDt.SUBJECT_NM}</td>
							
							<input type="hidden" name="YEAR" +${i.index} value="${listDt.YEAR}"></input>
							<input type="hidden" name="MAJOR_CD" +${i.index} value="${maorjCd}"></input>
							<input type="hidden" name="SMT" +${i.index} value="${listDt.SMT}"></input>
							<input type="hidden" name="SUBJECT_CD" +${i.index} value="${listDt.SUBJECT_CD}"></input>
							<input type="hidden" name="SUBJECT_NM" +${i.index} value="${listDt.SUBJECT_NM}"></input>
							<input type="hidden" name="DEPT_CD" +${i.index} value="${listDt.DEPT_CD}"></input>
							<input type="hidden" name="DEPT_NM" +${i.index} value="${listDt.DEPT_NM}"></input>
							<input type="hidden" name="COMDIV_CODE" +${i.index}	value="${listDt.COMDIV_CODE}"></input>
							<input type="hidden" name="COMDIV_CODE_NM" +${i.index} value="${listDt.COMDIV_CODE_NM}"></input>
							<input type="hidden" name="COM_GRADE" +${i.index} value="${listDt.COM_GRADE}"></input>
							<input type="hidden" name="CDT_NUM" +${i.index} value="${listDt.CDT_NUM}"></input>
							<input type="hidden" name="WTIME_NUM" +${i.index} value="${listDt.WTIME_NUM}"></input>
							<input type="hidden" name="PTIME_NUM" +${i.index} value="${listDt.PTIME_NUM}"></input>
							
						</tr>
						<c:set var="listNo" value="${listNo + 1}" />
					</c:forEach>
				</tbody>
			</table>
		</div>
	</form>

</div>

<div class="btnCenter">
	<input type="submit" id="saveSub" class="btnTypeA fn_btn_submit" value="교과목 추가" title="교과목 추가" /> 
		<a href="javascript:self.close();" title="닫기" class="btnTypeB back_to_list"> 닫기 </a>
</div>

<c:if test="${!empty BOTTOM_PAGE}"><jsp:include
		page="${BOTTOM_PAGE}" flush="false" /></c:if>