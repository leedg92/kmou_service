<%@ include file="../../../../include/commonTop.jsp"%>
<link rel="stylesheet" type="text/css" href="../../../css/majorInfo.css" />
<link rel="stylesheet" href="../../../assets/css/style.css">
<link rel="stylesheet" type="text/css" href="${contextPath}${cssAssetPath}/sub.css">
<link rel="stylesheet" href="../../../css/contents.css">
<script src="../../../assets/js/jquery-3.7.1.min.js"></script>
<script src="../../../assets/js/slick.js"></script>
<script src="../../../assets/js/bootstrap.min.js"></script>
<script src="../../../assets/js/bootstrap.bundle.min.js"></script>
<script src="../../../assets/js/index.global.min.js"></script>
<script src="../../../assets/js/common.js"></script>
<script src="../../../assets/js/sub.js"></script>
<%@ taglib prefix="elfn" uri="/WEB-INF/tlds/el-fn.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="pgui" tagdir="/WEB-INF/tags/pagination"%>
<%@ taglib prefix="elui" uri="/WEB-INF/tlds/el-tag.tld"%>
<%@ taglib prefix="itui" tagdir="/WEB-INF/tags/item"%>
<c:set var="itemOrderName" value="${submitType}_order" />
<c:set var="itemOrder" value="${itemInfo[itemOrderName]}" />
<c:set var="itemObjs" value="${itemInfo.items}" />
<!--content-->
<div class="container_wrap" style="padding-top: 0px;">
	<div class="sub_wrap">
		<div class="sub_background speci_bg">
			<section class="inner">
				<h3 class="title fw-bolder text-center text-white">전공</h3>
			</section>
		</div>

		<script type="text/javascript">
			
			/* window.onload = function() {				
				var cellaa = document.getElementById('Caa');
				var cellab = document.getElementById('Cab');
				var cellac = document.getElementById('Cac');
				alert("dfdfdf");
				alert(cellaa.innerHTML.trim());
				alert(cellab.innerHTML.trim());
				alert(cellac.innerHTML);
				
				
				if(cellaa.innerHTML.trim() == null && cellab.innerHTML.trim() == null) {
					alert("durl@@@@@@@@@@@");
					cellaa.parentNode.removeChild(cellaa);
					cellaa.parentNode.removeChild(cellab);
					
				} else {
					alert("dfdfdf!!!!!!!!!");
					cellaa.remove()
					cellab.remove()					
				}
			} */
		
			/* document.addEventListener("DOMContentLoaded", function() {
			    const tableRows = document.querySelectorAll("#table d-none d-xxl-table");
			    			    
			    tableRows.forEach(row => {
			    	
			        const cells = row.querySelectorAll("td");
			        let isEmpty = true;
			        for (let i = 0; i < 4; i++) {
			            if (cells[i].textContent.trim().length == '') {
			                isEmpty = false;
			                break;
			            }
			        }
			        alert("isEmpty : "+ isEmpty)
			        if (!isEmpty) {
			            cells[8].rowSpan = 2;
			            for (let i = 0; i < 8; i++) {
			            	alert(cells[i].parentNode+"isempty");
			                cells[i].parentNode.style.display = 'none';
			            }
			        }
			    });
			}); */
		
		</script>

		<!--본문-->
		<section class="inner mt-5">
			<!--제목-->
			<section class="detail_title_wrap">
				<section
					class="d-flex flex-row justify-content-between align-items-center title_box px-2 py-3 mb-5">
					<a href="#" title="이전페이지"
						class="d-flex flex-row align-items-center gap-2"><img
						src="../../../assets/images/arr_blue.png" /><em
						class="fst-normal">이전페이지</em></a>
					<h5
						class="content_title text-center fw-bolder d-flex align-items-center justify-content-center gap-1 flex-wrap">

						<span class="col-12 col-md-auto text-truncate">${basicInfoList.MJ_NM_KOR }</span>
					</h5>
					<div class="like_container">
						<div class="link_cnt text-end">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 18">
								<path
									d="M18.23 1.98C17.08.89 15.55.29 13.92.29c-1.44 0-2.81.47-3.9 1.33A6.262 6.262 0 0 0 6.12.29c-1.64 0-3.17.6-4.32 1.69C.65 3.08.01 4.53.01 6.07s.64 3 1.79 4.09l7.8 7.39a.62.62 0 0 0 .83 0l7.79-7.38v-.01c2.37-2.25 2.37-5.92 0-8.17Z"
									style="fill:#fff;stroke-width:0" />
								<path
									d="M18.23 1.98C17.08.89 15.55.29 13.92.29c-1.44 0-2.81.47-3.9 1.33A6.262 6.262 0 0 0 6.12.29c-1.64 0-3.17.6-4.32 1.69C.65 3.07.01 4.53.01 6.07s.63 3 1.79 4.09 7.8 7.39 7.8 7.39c.11.1.26.16.41.16.15 0 .3-.06.41-.16l7.79-7.38v-.01c2.37-2.25 2.37-5.92 0-8.17Zm-.83 7.39-7.39 7-7.39-7c-.93-.89-1.44-2.06-1.44-3.3s.51-2.42 1.44-3.3c.94-.89 2.19-1.38 3.49-1.37 1.32 0 2.55.49 3.48 1.37.23.22.6.22.83 0 .94-.89 2.19-1.38 3.49-1.37 1.32 0 2.55.49 3.49 1.37 1.92 1.82 1.92 4.78 0 6.6Z"
									style="stroke-width:0;fill:#ff0202" /></svg>
						</div>
					</div>
				</section>
			</section>

			<!--요약및개요-->
			<section class="speci_summary p-4 mb-4">
				<h6 class="text-center mb-3 fw-semibold">요약 및 개요</h6>
				<p class="text-center">${basicInfoList.MJ_INTRO_KOR }</p>
			</section>

			<!--인재상-->
			<c:if test="${!empty abilityInfoList }">
			<section class="speci_talent">
				<h5 class="fw-semibold mb-3">
					인재상 <span class="text-grn">[${basicInfoList.IDEAL_STU_KOR }]</span>
				</h5>
				<table class="table mb-0">
					<caption class="blind">인재상</caption>
					<colgroup>
						<col width="20%" />
						<col width="25%" />
						<col width="55%" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col" class="text-center border-end p-3">인재상</th>
							<th scope="col" class="border-end p-3">전공능력</th>
							<th scope="col" class="p-3">전공능력 정의</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="abilityInfoListDt" items="${abilityInfoList}"
							varStatus="status">
							<tr>
								<c:if
									test="${status.index eq 0 || abilityInfoListDt.SPT_PSN_KOR ne abilityInfoList[status.index - 1].SPT_PSN_KOR}">
									<th scope="rowgroup"
										rowspan="${abilityInfoListDt.ABILITY_COUNT }"
										class="px-3 text-center align-middle border-end">
										${abilityInfoListDt.SPT_PSN_KOR }</th>
								</c:if>
								<td class="border-end px-3">${abilityInfoListDt.MJ_ABTY_KOR }</td>
								<td class="px-3">${abilityInfoListDt.MJ_ABTY_DEFN_KOR }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</section>
			</c:if>

			<!--학부(과)교육과정-->
			<main class="speci_curric">
			<h5 class="mb-3 fw-semibold d-flex flex-column flex-sm-row justify-content-between align-items-start align-items-sm-end ">
                                    학부(과) 교육과정
                        <ul class="d-flex flex-row align-items-center gap-3">
                            <li class="comm_mark">전공공통(학점)</li>
                            <li class="ass_mark">전공필수(학점)</li>
                            <li class="cho_mark">전공선택(학점)</li>
                        </ul>
                    </h5>


			<!--테이블 ver웹-->
			                   <table class="curricT table d-none d-xxl-table ">
                        <caption class="blind">학부(과)교육과정</caption>
                        <colgroup>
                            <col width="15%"/>
                            <col width="auto"/>
                            <col width="auto"/>
                            <col width="auto"/>
                            <col width="auto"/>
                            <col width="auto"/>
                            <col width="auto"/>
                            <col width="auto"/>
                            <col width="auto"/>
                        </colgroup>
                        <thead>
                            <tr>
                                <th rowspan="2" scope="row" class="text-center align-middle border-end">분야</th>
                                <th colspan="2" scope="rowgroup" class="text-center align-middle border-end">1학년</th>
                                <th colspan="2" scope="rowgroup" class="text-center align-middle border-end">2학년</th>
                                <th colspan="2" scope="rowgroup" class="text-center align-middle border-end">3학년</th>
                                <th colspan="2" scope="rowgroup" class="text-center align-middle">4학년</th>
                                
                            </tr>
                            <tr>
                                <th scope="row" class="text-center align-middle border-end">1학기</th>
                                <th scope="row" class="text-center align-middle border-end">2학기</th>
                                <th scope="row" class="text-center align-middle border-end">1학기</th>
                                <th scope="row" class="text-center align-middle border-end">2학기</th>
                                <th scope="row" class="text-center align-middle border-end">1학기</th>
                                <th scope="row" class="text-center align-middle border-end">2학기</th>
                                <th scope="row" class="text-center align-middle border-end">1학기</th>
                                <th scope="row" class="text-center align-middle">2학기</th>
                            </tr>
                        </thead>
                            <!-- ass ::::클래스 추가시 전공필수-->
				<tbody>
					<c:forEach var="courMajorInfoListDt" items="${courMajorInfoList}"
						varStatus="status">
						<c:choose>
							<c:when test="${!empty courMajorInfoListDt.C11 or !empty courMajorInfoListDt.C12
							or !empty courMajorInfoListDt.C21 or !empty courMajorInfoListDt.C22
							or !empty courMajorInfoListDt.C31 or !empty courMajorInfoListDt.C32
							or !empty courMajorInfoListDt.C41 or !empty courMajorInfoListDt.C42}">
								<tr>
									<c:choose>																											
										<c:when test="${!empty courMajorInfoListDt.C13 or !empty courMajorInfoListDt.C23 
										or !empty courMajorInfoListDt.C33 or !empty courMajorInfoListDt.C43}">									
											<th class="px-3 text-center align-middle border-end"
											scope="col" colspan="1" rowspan="2">${courMajorInfoListDt.SPT_PSN_KOR }</th>									
										</c:when>
										<c:otherwise>
											<th class="px-3 text-center align-middle border-end"
											scope="col" colspan="1" rowspan="1">${courMajorInfoListDt.SPT_PSN_KOR }</th>
										</c:otherwise>
									</c:choose>																		
									<td class="px-2 " id="Caa">${courMajorInfoListDt.C11 }</td>
									<td class="px-2" id="Cab">${courMajorInfoListDt.C12 }</td>
									<td class="px-2" id="Cba">${courMajorInfoListDt.C21 }</td>
									<td class="px-2" id="Cbb">${courMajorInfoListDt.C22 }</td>
									<td class="px-2" id="Cca">${courMajorInfoListDt.C31 }</td>
									<td class="px-2" id="Ccb">${courMajorInfoListDt.C32 }</td>
									<td class="px-2" id="Cda">${courMajorInfoListDt.C41 }</td>
									<td class="px-2" id="Cdb">${courMajorInfoListDt.C42 }</td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr></tr>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${!empty courMajorInfoListDt.C13 or !empty courMajorInfoListDt.C23 
							or !empty courMajorInfoListDt.C33 or !empty courMajorInfoListDt.C43}">
							
								<c:choose>
									<c:when test="${!empty courMajorInfoListDt.C11 or !empty courMajorInfoListDt.C12
										or !empty courMajorInfoListDt.C21 or !empty courMajorInfoListDt.C22
										or !empty courMajorInfoListDt.C31 or !empty courMajorInfoListDt.C32
										or !empty courMajorInfoListDt.C41 or !empty courMajorInfoListDt.C42}">
										<tr>
											
											<td id="Cac" class="px-3 text-center align-middle" colspan="2">${courMajorInfoListDt.C13 }</td>
											<td id="Cbc" class="px-3 text-center align-middle" colspan="2">${courMajorInfoListDt.C23 }</td>
											<td id="Ccc" class="px-3 text-center align-middle" colspan="2">${courMajorInfoListDt.C33 }</td>
											<td id="Cdc" class="px-3 text-center align-middle" colspan="2">${courMajorInfoListDt.C43 }</td>
										</tr>
									</c:when>
									<c:otherwise>
										<tr>
											<th class="px-3 text-center align-middle border-start"
											scope="col" rowspan="2">${courMajorInfoListDt.SPT_PSN_KOR }</th>
											<td id="Cac" class="px-3 text-center align-middle" colspan="2" >${courMajorInfoListDt.C13 }</td>											
											<td id="Cbc" class="px-3 text-center align-middle" colspan="2" >${courMajorInfoListDt.C23 }</td>
											<td id="Ccc" class="px-3 text-center align-middle" colspan="2" >${courMajorInfoListDt.C33 }</td>
											<td id="Cdc" class="px-3 text-center align-middle" colspan="2" >${courMajorInfoListDt.C43 }</td>
										</tr>									
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<tr />
							</c:otherwise>
						</c:choose>
						
					</c:forEach>
				</tbody>
                    </table>

			<!--테이블 ver모바일-->
			<table class="table d-table d-xxl-none">
				<caption class="blind">학부(과)교육과정</caption>
				<colgroup>
					<col width="15%;">
					<col width="20%;">
					<col width="auto;">
				</colgroup>
				<thead>
					<tr>
						<th scope="colgroup" colspan="2" rowspan="2"
							class="align-middle text-center border-end">학년 및 학기</th>
						<th scope="col" class="align-middle text-center">인재상</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="courMajorInfoListDtmobile"
						items="${courMajorInfoList}" varStatus="status">
						<tr>
							<th scope="rowgroup" rowspan="2"
								class="text-center align-middle border-end">1학년</th>
							<th scope="row" class="text-center align-middle border-end">1학기</th>
							<td class="px-3 align-middle">
								${courMajorInfoListDtmobile.C11}</td>
						</tr>
						<tr>
							<th scope="row" class="text-center align-middle border-end">2학기</th>
							<td class="px-3 align-middle">
								${courMajorInfoListDtmobile.C12}</td>
						</tr>
						<tr>
							<th scope="rowgroup" rowspan="2"
								class="text-center align-middle border-end">2학년</th>
							<th scope="row" class="text-center align-middle border-end">1학기</th>
							<td class="px-3 align-middle">
								${courMajorInfoListDtmobile.C21}</td>
						</tr>
						<tr>
							<th scope="row" class="text-center align-middle border-end">2학기</th>
							<td class="px-3 align-middle">
								${courMajorInfoListDtmobile.C22}</td>
						</tr>
						<tr>
							<th scope="rowgroup" rowspan="2"
								class="text-center align-middle border-end">3학년</th>
							<th scope="row" class="text-center align-middle border-end">1학기</th>
							<td class="px-3 align-middle">
								${courMajorInfoListDtmobile.C31}</td>
						</tr>
						<tr>
							<th scope="row" class="text-center align-middle border-end">2학기</th>
							<td class="px-3 align-middle">
								${courMajorInfoListDtmobile.C32}</td>
						</tr>
						<tr>
							<th scope="rowgroup" rowspan="2"
								class="text-center align-middle border-end">4학년</th>
							<th scope="row" class="text-center align-middle border-end">1학기</th>
							<td class="px-3 align-middle">
								${courMajorInfoListDtmobile.C41}</td>
						</tr>
						<tr>
							<th scope="row" class="text-center align-middle border-end">2학기</th>
							<td class="px-3 align-middle">
								${courMajorInfoListDtmobile.C42}</td>
						</tr>
						<%-- <tr>
								<th scope="rowgroup" rowspan="2"
									class="text-center align-middle border-end">5학년</th>
								<th scope="row" class="text-center align-middle border-end">1학기</th>
								<td class="px-3 align-middle">
									${courMajorInfoListDtmobile.C51}
								</td>
							</tr>
							<tr>
								<th scope="row" class="text-center align-middle border-end">2학기</th>
								<td class="px-3 align-middle">
									${courMajorInfoListDtmobile.C52}
								</td>
							</tr> --%>
					</c:forEach>
				</tbody>
			</table>

			</main>
			
			
           <!--추천균형교양-->
           <section class="speci_balan">
               <h5 class="mb-3 fw-semibold">추천균형교양</h5>
               <div class="">
               <c:forEach var="rcmdCultInfoListDt" items="${rcmdCultInfoList}" varStatus="status">
                   <dl>
                       <dt>${rcmdCultInfoListDt.EDU_CORS_CAPB_NM }</dt>
                       <dd>${rcmdCultInfoListDt.SBJT_NM_KOR }</dd>
                   </dl>
               </c:forEach>
               </div>
           </section>			

			<!--졸업후진로-->
			<section class="speci_micro">
				<h5 class="mb-3 fw-semibold">졸업 후 진로</h5>
				<div class=" border px-4 py-3">${basicInfoList.GRDT_AF_CARR_KOR }</div>
			</section>

			<c:if test="${!empty microInfoList }">
              <!--마이크로전공-->
                <section class="speci_micro">
                    <h5 class="mb-3 fw-semibold">마이크로 전공</h5>

                    <!--마이크로전공 item-->
                    <c:forEach var="microListDt" items="${microInfoList }">
                    <div class="box mb-4">
                        <h6 class="mb-2 fw-normal"><strong>${microListDt.KOR_NM }</strong>${microListDt.ENG_NM }</h6>
                        <div class="border mb-3 p-3 ">
                            	${microListDt.OUTLN_KR }
                        </div>                     
                        <h6 class="mb-2 fw-bolder">교육과정</h6>

                        <table class="table curricT d-none d-lg-table">
                            <caption class="blind">전공 - 마이크로전공 과목</caption>
                            <colgroup>
                                <col width="auto"/>
                            </colgroup>
                            <thead>
                                <tr>
                                    <th colspan="2" class="text-center border-end" scope="rowgroup">1학년</th>
                                    <th colspan="2" class="text-center border-end" scope="rowgroup">2학년</th>
                                    <th colspan="2" class="text-center border-end" scope="rowgroup">3학년</th>
                                    <th colspan="2" class="text-center" scope="rowgroup">4학년</th>
                                </tr>
                                <tr>
                                    <th class="text-center border-end" scope="row">1학기</th>
                                    <th class="text-center border-end" scope="row">2학기</th>
                                    <th class="text-center border-end" scope="row">1학기</th>
                                    <th class="text-center border-end" scope="row">2학기</th>
                                    <th class="text-center border-end" scope="row">1학기</th>
                                    <th class="text-center border-end" scope="row">2학기</th>
                                    <th class="text-center border-end" scope="row">1학기</th>
                                    <th class="text-center" scope="row">2학기</th>
                                </tr>
                            </thead>
                                <tbody>
									<c:forEach var="microSbjtListDt" items="${microSbjtInfoList}" varStatus="status">
											<c:if test="${microListDt.KOR_NM eq microSbjtListDt.MCM_KOR_NM}">
											<c:choose>
												<c:when test="${!empty microSbjtListDt.C11 or !empty microSbjtListDt.C12
												or !empty microSbjtListDt.C21 or !empty microSbjtListDt.C22
												or !empty microSbjtListDt.C31 or !empty microSbjtListDt.C32
												or !empty microSbjtListDt.C41 or !empty microSbjtListDt.C42}">
													<tr>
														<td class="text-start border-end" id="Caa">${microSbjtListDt.C11 }</td>
														<td class="text-start border-end" id="Cab">${microSbjtListDt.C12 }</td>
														<td class="text-start border-end" id="Cba">${microSbjtListDt.C21 }</td>
														<td class="text-start border-end" id="Cbb">${microSbjtListDt.C22 }</td>
														<td class="text-start border-end" id="Cca">${microSbjtListDt.C31 }</td>
														<td class="text-start border-end" id="Ccb">${microSbjtListDt.C32 }</td>
														<td class="text-start border-end" id="Cda">${microSbjtListDt.C41 }</td>
														<td class="text-start border-end" id="Cdb">${microSbjtListDt.C42 }</td>										
													</tr>
												</c:when>
												<c:otherwise>
													<tr></tr>
												</c:otherwise>
											</c:choose>
											<c:choose>
												<c:when test="${!empty microSbjtListDt.C13 or !empty microSbjtListDt.C23 
												or !empty microSbjtListDt.C33 or !empty microSbjtListDt.C43}">
												
													<c:choose>
														<c:when test="${!empty microSbjtListDt.C11 or !empty microSbjtListDt.C12
															or !empty microSbjtListDt.C21 or !empty microSbjtListDt.C22
															or !empty microSbjtListDt.C31 or !empty microSbjtListDt.C32
															or !empty microSbjtListDt.C41 or !empty microSbjtListDt.C42}">
															<tr>
																
																<td id="Cac" class="text-center border-end" colspan="2">${microSbjtListDt.C13 }</td>
																<td id="Cbc" class="text-center border-end" colspan="2">${microSbjtListDt.C23 }</td>
																<td id="Ccc" class="text-center border-end" colspan="2">${microSbjtListDt.C33 }</td>
																<td id="Cdc" class="text-center border-end" colspan="2">${microSbjtListDt.C43 }</td>
															</tr>
														</c:when>
														<c:otherwise>
															<tr>
																<td id="Cac" class="text-center border-end" colspan="2" >${microSbjtListDt.C13 }</td>											
																<td id="Cbc" class="text-center border-end" colspan="2" >${microSbjtListDt.C23 }</td>
																<td id="Ccc" class="text-center border-end" colspan="2" >${microSbjtListDt.C33 }</td>
																<td id="Cdc" class="text-center border-end" colspan="2" >${microSbjtListDt.C43 }</td>
															</tr>									
														</c:otherwise>
													</c:choose>
												</c:when>
												<c:otherwise>
													<tr />
												</c:otherwise>
											</c:choose>
											</c:if>
									</c:forEach>
                                </tbody>
                            
                        </table>
                         <div class="mobile_speci_table d-block d-lg-none">
                            <table class="table curricT">
                                <caption class="blind">전공 - 마이크로전공 과목</caption>
                                <colgroup>
                                    <col width="100px"/>
                                    <col width="100px"/>
                                    <col width="auto"/>
                                    <col width="auto"/>
                                </colgroup>
                                <tbody>
                         		<c:forEach var="microSbjtListDtMobile" items="${microSbjtInfoList}" varStatus="status">
									<c:if test="${microListDt.KOR_NM eq microSbjtListDtMobile.MCM_KOR_NM}">
                                    <tr>
                                        <th scope="rowgroup" class="text-center border-end align-middle" rowspan="2">1학년</th>
                                        <th scope="row" class="text-center border-end align-middle">1학기</th>
                                        <td class="text-start border-end">
                                            ${microSbjtListDtMobile.C11}
                                        </td>
                                        <td class="text-start" rowspan="2">
                                            ${microSbjtListDtMobile.C13}
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="text-center border-end align-middle">2학기</th>
                                        <td class="text-start border-end align-middle">
                                            ${microSbjtListDtMobile.C12}
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="rowgroup" class="text-center border-end align-middle" rowspan="2">2학년</th>
                                        <th scope="row" class="text-center border-end align-middle">1학기</th>
                                        <td class="text-start border-end">
                                            ${microSbjtListDtMobile.C21}
                                        </td>
                                        <td class="text-start" rowspan="2">
                                            ${microSbjtListDtMobile.C23}
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="text-center border-end align-middle">2학기</th>
                                        <td class="text-start border-end align-middle">
                                            ${microSbjtListDtMobile.C22}
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="rowgroup" class="text-center border-end align-middle" rowspan="2">3학년</th>
                                        <th scope="row" class="text-center border-end align-middle">1학기</th>
                                        <td class="text-start border-end" >
                                            ${microSbjtListDtMobile.C31}
                                        </td>
                                        <td class="text-start" rowspan="2">
                                            ${microSbjtListDtMobile.C33}
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="text-center border-end align-middle">2학기</th>
                                        <td class="text-start border-end align-middle">
                                            ${microSbjtListDtMobile.C32}
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="rowgroup" class="text-center border-end align-middle" rowspan="2">4학년</th>
                                        <th scope="row" class="text-center border-end align-middle">1학기</th>
                                        <td class="text-start border-end">
                                            ${microSbjtListDtMobile.C41}
                                        </td>
                                        <td class="text-start"  rowspan="2">
                                            ${microSbjtListDtMobile.C43}
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="text-center border-end align-middle">2학기</th>
                                        <td class="text-start border-end align-middle">
                                            ${microSbjtListDtMobile.C42}
                                        </td>
                                    </tr>
                                    </c:if>
                                  </c:forEach>
                                </tbody>
                                
                            </table>
                        </div>
                    </div>
                    </c:forEach>
                </section>
                </c:if>

			<!--닫기-->
			<a href="javascript:self.close();" title="닫기" class="back_to_list">
				닫기 </a>
		</section>

	</div>




</div>

<script type="text/javascript">
history.replaceState({path : window.location.pathname},'', window.location.pathname);

</script>