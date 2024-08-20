<%@ include file="../../include/commonTop.jsp"%>
<%@ taglib prefix="itui" tagdir="/WEB-INF/tags/item"%>
<c:set var="itemOrderName" value="${submitType}_order" />
<itui:submitScript items="${itemInfo.items}"
	itemOrder="${itemInfo[itemOrderName]}" />
<script type="text/javascript">

var sptPsnKorList = [];

$(function(){
	<itui:submitInit items="${itemInfo.items}" itemOrder="${itemInfo[itemOrderName]}"/>
	fn_sampleInputReset();
	// getCollegeData();
	
	var originUrl = window.location.href;
	history.replaceState({path : window.location.pathname},'', window.location.pathname);
	
	$("#refresh").click(function(){
		var confirmVal = confirm("조회 시 입력하시던 정보는 사라집니다. 조회하시겠습니까?");
		
		if(confirmVal){
			window.location.href = originUrl;
		}
	});	
	
	// 소속구분 변경시 대학 세팅
	$('#s_colgCd').change( function() {			
		getDeptData($('#s_colgCd').val());
	});
	// 소속대학 선택 시 학과 목록 선택값 변경	
	$('#s_fcltSustCd').change( function() {
		getMajorData($('#s_fcltSustCd').val());
	});
	
	$('#s_mjCd').change( function() {
		getRegisteredYear($('#s_mjCd').val());
		$('#mjNmKor').val($('#s_mjCd option:selected').text());
		$('#mjNmEng').val($('#s_mjCd option:selected').attr('deptnmeng'));
		$("#yearbox").show();
	});

	
	$("#graduationCnt, #collegeCnt").change(function() {
		$("#graduationRate").val( ($("#collegeCnt").val() / $("#graduationCnt").val() * 1000 / 10.0 ).toFixed(1) );
	});
	$("#jobCnt, #insuranceCnt").change(function() {
		$("#jobRate").val( ($("#insuranceCnt").val() / $("#jobCnt").val() * 1000 / 10.0).toFixed(1) );
	});
	
	// reset
	$("#<c:out value="${param.inputFormId}"/> .fn_btn_reset").click(function(){
		try {
			$("#<c:out value="${param.inputFormId}"/>").reset();
			fn_sampleInputReset();
		}catch(e){alert(e); return false;}
	});
	<c:if test="${isAdmMode}">
	// cancel
	$("#<c:out value="${param.inputFormId}"/> .fn_btn_cancel").click(function(){
		try {
			<c:choose>
				<c:when test="${param.dl == '1'}">
				self.close();
				</c:when>
				<c:otherwise>
				location.href="${elfn:replaceScriptLink(URL_LIST)}";
				</c:otherwise>
			</c:choose>
		}catch(e){return false;}
	});
	
	$("#<c:out value="${param.inputFormId}"/> .fn_btn_trackCancel").click(function(){
		try {
			<c:choose>
				<c:when test="${param.dl == '1'}">
				self.close();
				</c:when>
				<c:otherwise>
				location.href="${elfn:replaceScriptLink(URL_TRACK_LIST)}";
				</c:otherwise>
			</c:choose>
		}catch(e){return false;}
	});
	$("#<c:out value="${param.inputFormId}"/> .fn_btn_jobCancel").click(function(){
		try {
			<c:choose>
				<c:when test="${param.dl == '1'}">
				self.close();
				</c:when>
				<c:otherwise>
				location.href="${elfn:replaceScriptLink(URL_LIST)}";
				</c:otherwise>
			</c:choose>
		}catch(e){return false;}
	});
	
	//전문인 추가 행 추가
	$("[id^=addSub]").click(function(){
		
		var idValue = $(this).attr('id');
		var indexNumber = idValue.replace("addSub",'');
		
		var index = $("#tpSubContent > tbody > tr").length;
		var length = Number($("#majorRowLength").val());
		var dtLength = Number($("#dtLength").val());
		var sbjtFgNm = $("#sbjtFgNm" + indexNumber).val();
		var openShyrNm = $("#openShyrNm" + indexNumber).val();
		var shtmNm = $("#shtmNm" + indexNumber).val();
		var shtmCd = $("#shtmCd" + indexNumber).val();
		var openSustMjNm = $("#openSustMjNm" + indexNumber).val();
		var sptPsnKor = $("#s_sptPsnKor" + indexNumber).val();
		var shyrFg = $("#shyrFg" + indexNumber).val();
		var sbjtNmKor = $("#sbjtNmKor" + indexNumber).val();
		var sbjtFg = $("#sbjtFg" + indexNumber).val();
		var lastModiId = $("#lastModiId" + indexNumber).val();
		var lastModiDate = $("#lastModiDate" + indexNumber).val();
		var courseNo = $("#courseNo" + indexNumber).val();
		var pnt = $("#pnt" + indexNumber).val();
		var theoTmCnt = $("#theoTmCnt" + indexNumber).val();
		var pracTmCnt = $("#pracTmCnt" + indexNumber).val();
		var courseNo = $("#courseNo" + indexNumber).val();
		var inputList = ["sptPsnKor"];
		var inputName = ["전문인(한글)"];
		
		length += 1;
		$("#majorRowLength").val(length);
		var innerHtml = "";
		
		//innerHtml += '<tr><td><button type="button" id="delete' + (index -1) + '" data-idx="' + (index -1) + '" class="btn-m02 btn-color02">삭제</button></td>'
		//innerHtml += '<tr><td><input type="checkbox" class="checkbox-type01" name="chkbox"></td>'
		innerHtml += '<tr>'
		innerHtml += '<td class="num" id="num"></td>'
// 		innerHtml += '<td><input type="hidden" value="'+ (length-2) +'" name="ord' + (length -2) + '"><span id="ord">' + (length-1) + '</span></td>'
		innerHtml += '<td><input type="hidden" value="'+ sbjtFgNm +'" name="sbjtFgNm' + (length -2) + '" id="sbjtFgNm' + (length -2) + '"><span >' + sbjtFgNm + '</span></td>'
		innerHtml += '<td><input type="hidden" value="'+ openShyrNm +'" name="openShyrNm' + (length -2) + '" id="openShyrNm' + (length -2) + '"><span >' + openShyrNm + '</span></td>'
		innerHtml += '<td><input type="hidden" value="'+ shtmNm +'" name="shtmNm' + (length -2) + '" id="shtmNm' + (length -2) + '"><span >' + shtmNm + '</span></td>'
		innerHtml += '<td><input type="hidden" value="'+ openSustMjNm +'" name="openSustMjNm' + (length -2) + '" id="openSustMjNm' + (length -2) + '"><span >' + openSustMjNm + '</span></td>'		
		innerHtml += '<td><input type="hidden" value="'+ sbjtNmKor +'" name="sbjtNmKor' + (length -2) + '" id="sbjtNmKor' + (length -2) + '"><span >' + sbjtNmKor + '</span></td>'
		
		innerHtml += '<td><select name="is_sptPsnKor'+ (length -2) +'" id="s_sptPsnKor' + (length -2) + '" class="select" style="width:60%" title="인재상" "></select> '+ '</td>'
		
		innerHtml += '<td><button type="button" class="btnTypeG">NEW</button></td>'
		
		innerHtml += '<td><button type="button" onclick=fun_delete_major(this); id="fn_btn_majorCancel" class="btnTypeF">삭제</button></td>'		
	
		innerHtml += '<input type="hidden" value="'+ lastModiId +'" name="lastModiId' + (length -2) + '" id="lastModiId' + (length -2) + '">'
		innerHtml += '<input type="hidden" value="'+ courseNo +'" name="courseNo' + (length -2) + '" id="courseNo' + (length -2) + '">' + '</>'
		innerHtml += '<input type="hidden" value="'+ shyrFg +'" name="shyrFg' + (length -2) + '" id="shyrFg' + (length -2) + '">' + '</>'
		innerHtml += '<input type="hidden" value="'+ shtmCd +'" name="shtmCd' + (length -2) + '" id="shtmCd' + (length -2) + '">' + '</>'
		innerHtml += '<input type="hidden" value="'+ sbjtFg +'" name="sbjtFg' + (length -2) + '" id="sbjtFg' + (length -2) + '">' + '</>'
		innerHtml += '<input type="hidden" value="'+ pnt +'" name="pnt' + (length -2) + '" id="pnt' + (length -2) + '">' + '</>'
		innerHtml += '<input type="hidden" value="'+ theoTmCnt +'" name="theoTmCnt' + (length -2) + '" id="theoTmCnt' + (length -2) + '">' + '</>'
		innerHtml += '<input type="hidden" value="'+ pracTmCnt +'" name="pracTmCnt' + (length -2) + '" id="pracTmCnt' + (length -2) + '">' + '</>'
		innerHtml += '<input type="text" name="dtLength" value="' + length + '"/>'
		innerHtml += '</tr>'			
		$("#dtLength").val(length);
		$(this).closest('tr').after(innerHtml);
		
		for(var i=0; i < sptPsnKorList.length; i++){
			$('#s_sptPsnKor'+(length -2)).append("<option value='" + sptPsnKorList[i].SPT_PSN_KOR + "'>" + sptPsnKorList[i].SPT_PSN_NM + "</option>");
		}
		
		$("#tpSubContent tbody tr").each(function(index){			
			$(this).find("#num").text(index + 1);
		})
		
// 		$("#tpSubContent > tbody:last").append(innerHtml);
		$("#sptPsnKor"+ (length-2)).focus();		

	});
	
	</c:if>
	// 등록/수정
	$("#<c:out value="${param.inputFormId}"/>").submit(function(){
		try {
			return fn_sampleInputFormSubmit();
		}catch(e){alert(e); return false;}
	});

	// 소속 구분 검색 정보 불러오기
	<c:if test="${!empty param.is_clsfCd}">
			var clsfCd = '<c:out value="${param.is_clsfCd}"/>';
			$('#s_clsfCd').val(clsfCd);
			getDeptData(clsfCd);		
	</c:if>
		// 대학 검색 정보 불러오기
	<c:if test="${!empty param.is_colgCd}">
			var colgCd = '<c:out value="${param.is_colgCd}"/>';		
			$('#s_colgCd').val(colgCd);
			getMajorData(colgCd);
	</c:if>
		// 학과/전공 검색 정보 불러오기
	<c:if test="${!empty param.is_deptCd}">
			var deptCd = '<c:out value="${param.is_deptCd}"/>';
			$('#s_deptCd').val(deptCd);
	</c:if>
	
	// 인재상 정보 불러오기
	<c:if test="${!empty param.mjCd}">
			var mjCd = '<c:out value="${param.mjCd}"/>';
			var year = '<c:out value="${param.year}"/>';
			getSptPsnData(mjCd,year);
	</c:if>
	


	
});

//학부 교육과정 인재상 입력 행 삭제
function fn_deleteTp(){
	// cancel
	$("#<c:out value="${param.inputFormId}"/> .fn_btn_cancel").click(function(){
		try {
			<c:choose>
				<c:when test="${param.dl == '1'}">
				self.close();
				</c:when>
				<c:otherwise>
				location.href="${elfn:replaceScriptLink(URL_LIST)}";
				</c:otherwise>
			</c:choose>
		}catch(e){return false;}
	});
}

function fun_delete_major(button){	
	
	var row = button.parentNode.parentNode;	
	row.parentNode.removeChild(row);
	
}


//학부 교육과정 인재상 입력 행 추가
function fn_sampleInputFormSubmit(){
	<itui:submitValid items="${itemInfo.items}" itemOrder="${itemInfo[itemOrderName]}"/>
	
	var inputList = ["sptPsnKor"];
	var inputName = ["전문인(한글)"];
	var docList = [];

	
	for(var p = 0; p < inputList.length; p++){
		
		
		var value = inputList[p]
		
		for(var i = 0; i <= $("#dtLength").val() ; i++){
			
			var sbjtFgNm = ($('#sbjtFgNm'+i).val());
			var openShyrNm = ($('#openShyrNm'+i).val());
			var shtmNm = ($('#shtmNm'+i).val());
			var openSustMjNm = ($('#openSustMjNm'+i).val());
			var courseNo = ($('#courseNo'+i).val());
			var sptPsnKor = ($('#s_sptPsnKor'+i).val());
			
			var cons = sbjtFgNm + openShyrNm + openSustMjNm + courseNo + sptPsnKor;
			
			docList.push(cons);
			
		}
		
		for(var i = 0; i <= $("#dtLength").val() ; i++){
			
			var id = '#s_' + value + i;
			var docId = '#docId' + ((docList.length)-1);
			console.log(docList.length);
			
			for (var k= 0 ; k < docList.length ; k++) {
				if ( i != k) {
					if(i != docList.length) {						
						if($('#s_sptPsnKor'+k).val() != undefined){
							if (docList[i] == null || docList[k] == null) {
								continue;
							}
							if (docList[k] == docList[i]){			
								alert("중복된 인재상(한글)을 입력할 수 없습니다");
								$(id).focus();
								return false;	
							}	
						}													
												
					} else {
						break;
					}
				}				
			}
		
			if ($(id).val() != null) {
				if($(id).val().trim() === ''){
					alert("인재상(한글) 항목들은 필수 입력값입니다.");
					$(id).focus();
					return false;
				}				
			}
			
		}	
		
		
	};
	
	fn_createMaskLayer();	
	// 여기서 값을 추가해주도록 변경
	
	const urlParams = new URL(location.href).searchParams;
	const majorIdx = urlParams.get('majorIdx');
	const yearIdx = urlParams.get('yearIdx');
	
	console.log("majorIdx", majorIdx)
	console.log("yearIdx", yearIdx)	
	
	$("#majorIdx").attr("value", majorIdx);
	$("#yearIdx").attr("value", yearIdx);
	return true;
}

function fn_sampleInputReset(){
	<itui:submitReset items="${itemInfo.items}" itemOrder="${itemInfo[itemOrderName]}"/>
}	
  // 대학 selectbox 세팅
function getCollegeData() {
	try {		
		$.ajax({
			url: '/web/haksaCode/getCollegeList.json?mId=141',
		    type: 'POST',
		    crossDomain: true,
		    beforeSend:function(request){
		    	request.setRequestHeader('Ajax','true');
		    }
			}).done(function (data, textStatus, xhr) {
				$("#s_fcltSustCd").children('option:not(:first)').remove();
				$("#s_mjCd").children('option:not(:first)').remove();
				for(var idx in data.haksaCode){
		        	$('#s_colgCd').append("<option value='" + data.haksaCode[idx].DEPT_CD + "' deptNmEng='" + data.haksaCode[idx].DEPT_ENG_NM + "'>" + data.haksaCode[idx].DEPT_KOR_NM + "</option>");
		    	}
			}).fail(function(data, textStatus, errorThrown){
			      /*pass*/
			      console.log('error 발생 : ' + errorThrown);
			});
	} catch(e){
		console.log(e);
	}
}


// 학과/학부 select 변경시
function getDeptData(clsfCd) {
	try {
		var colgCd = $('#s_colgCd').val();
		$.ajax({
			url: '/web/haksaCode/getDeptList.json?mId=141',
		    type: 'POST',
		    crossDomain: true,
		    data: {
		    	colgCd : colgCd
	  		},
		    beforeSend:function(request){
		    	request.setRequestHeader('Ajax','true');
		    }
			}).done(function (data, textStatus, xhr) {
				$("#s_fcltSustCd").children('option:not(:first)').remove();
				for(var idx in data.haksaCode){
		        	$('#s_fcltSustCd').append("<option value='" + data.haksaCode[idx].DEPT_CD + "' deptNmEng='" + data.haksaCode[idx].DEPT_ENG_NM + "'>" + data.haksaCode[idx].DEPT_KOR_NM + "</option>");
		    	}
				$('#s_colgCd').val(colgCd);
			}).fail(function(data, textStatus, errorThrown){
			      /*pass*/
			      console.log('error 발생 : ' + errorThrown);
			});
	} catch(e){
		console.log(e);
	}
}
 
// 학과/학부 select 변경시
function getMajorData(fcltSustCd) {
	try {		
		var fcltSustCd = $('#s_fcltSustCd').val();
		var fcltSustNm = $('#s_fcltSustCd option:selected').text();
		var fcltSustEngNm = $('#s_fcltSustCd option:selected').attr('deptnmeng');
		$.ajax({
			url: '/web/haksaCode/getMajorList.json?mId=141',
		    type: 'POST',
		    crossDomain: true,
		    data: {
		    	fcltSustCd : fcltSustCd
	  		},
		    beforeSend:function(request){
		    	request.setRequestHeader('Ajax','true');
		    }
			}).done(function (data, textStatus, xhr) {
				$("#s_mjCd").children('option:not(:first)').remove();
				// 학과/학부의 정보가 전공일시
				if(data.haksaCode.length == 0){					
					 if(fcltSustNm != '전체'){
						$('#s_mjCd option:first').val(fcltSustCd);
						$('#mjNmKor').val(fcltSustNm);
						$('#mjNmEng').val(fcltSustEngNm);
						getRegisteredYear(fcltSustCd);
						$("#yearbox").show();
					 }else{
						$('#s_mjCd option:first').val("");
					 }
				}else{
					for(var idx in data.haksaCode){
			        	$('#s_mjCd').append("<option value='" + data.haksaCode[idx].DEPT_CD + "' deptNmEng='" + data.haksaCode[idx].DEPT_ENG_NM + "'>" + data.haksaCode[idx].DEPT_KOR_NM + "</option>");
			    	}					
				}		
				$('#s_fcltSustCd').val(fcltSustCd);


			}).fail(function(data, textStatus, errorThrown){
			      /*pass*/
			      console.log('error 발생 : ' + errorThrown);
			});
	} catch(e){
		console.log(e);
	}
 }
 
// 인재상 리스트 불러오기
function getSptPsnData(mjCd,year) {
	
	var dtLength = Number($("#dtLength").val());
	
	try {		
		$.ajax({
			url: '/web/haksaCode/getSptPsnList.json?mId=192',
		    type: 'POST',
		    crossDomain: true,
		    data: {
		    	year : year,
		    	mjCd : mjCd
	  		},
		    beforeSend:function(request){
		    	request.setRequestHeader('Ajax','true');
		    }
			}).done(function (data, textStatus, xhr) {
				sptPsnKorList = data.haksaCode;
				for(var j=0; j <= dtLength; j++){					
					
		  			for(var i=0; i < sptPsnKorList.length; i++){

		  				if ($("#sptPsnKor"+j).val() == sptPsnKorList[i].SPT_PSN_KOR) {
		  					$('#s_sptPsnKor'+j).append("<option value='" + sptPsnKorList[i].SPT_PSN_KOR + "' selected>" + sptPsnKorList[i].SPT_PSN_NM  + "</option>");		  					
		  				} else {
		  					$('#s_sptPsnKor'+j).append("<option value='" + sptPsnKorList[i].SPT_PSN_KOR + "'>" + sptPsnKorList[i].SPT_PSN_NM + "</option>");	  						
		  				}		  				
			    	}		  			
		  			
		  			if ($("#sptPsnKor"+j).val() == $('#s_sptPsnKor'+j).val()) {
		  				$('#sptPsnKor'+j).val($('#s_sptPsnKor'+ j + 'option:selected').text());
		  			}		  			 
				}
			}).fail(function(data, textStatus, errorThrown){
			      /*pass*/
			      console.log('error 발생 : ' + errorThrown);
			});
	} catch(e){
		console.log(e);
	}	
}
	
	
	
	

 
function getRegisteredYear(value){
	$.ajax({
		url: '${URL_REGISTERED_YEAR}',
	    type: 'GET',
	    crossDomain: true,
	    data: {
	    	mjCd : value
  		},
  		success:function(data){
  			$("#year option").prop('disabled', false);
  			var registeredYearList = data.registeredYearList
  			for(var i=0; i < registeredYearList.length; i++){
  	  			$("#year option").each(function(){
  	  			var optionVal = $(this).val();
  					if(optionVal === registeredYearList[i].YY){
  						$(this).prop('disabled', true).text(optionVal + "(등록됨)");
  					}else{
  						$(this).prop('disabled', false).text(optionVal);
  					}
  				})
  			};

  		},
  		error:function(e){
  			alert(JSON.stringify(e))
  		}
		})

} 
</script>