<%@ include file="../../include/commonTop.jsp"%>
<%@ taglib prefix="itui" tagdir="/WEB-INF/tags/item" %>
<c:set var="itemOrderName" value="${submitType}_order"/>
<itui:submitScript items="${itemInfo.items}" itemOrder="${itemInfo[itemOrderName]}"/>
<script type="text/javascript">
	$(function(){
	<itui:submitInit items="${itemInfo.items}" itemOrder="${itemInfo[itemOrderName]}"/>
	fn_sampleInputReset();
	getCollegeData();
	
	

	// 대학 변경시 학과/학부 세팅
	$('#s_colgCd').change( function() {			
		getDeptData($('#s_colgCd').val());
		$('#s_mjCd').show();
		$("#s_mjCd").children('option:not(:first)').remove();
	});
	// 학과/학부 선택 시 전공 세팅	
	$('#s_fcltSustCd').change( function() {
		getMajorData($('#s_fcltSustCd').val());
	});
	
	// reset
	$("#<c:out value="${param.searchFormId}"/> .fn_btn_reset").click(function(){
		try {
			$("#<c:out value="${param.searchFormId}"/>").reset();
			fn_sampleInputReset();
		}catch(e){alert(e); return false;}
	});	

var jsonArray = [];
var obj = {};
//개설강좌(lecture) -			TABLE : VIEW_UNI_OPEN_LT
//비교과(nonSbjt) - 			TABLE : VIEW_UNI_NON_SBJT
//교수(prof) - 				TABLE : VIEW_UNI_PROF
//전공(major) - 				TABLE : VIEW_UNI_MJ
//학생설계전공(studPlan) - 		TABLE : VIEW_UNI_SDM

	
// $.ajax({
// 	url: '/web/bookmark/deleteSelectedBookmark.do?mId=197&menuFg=sbjt',
// 	contentType:'application/json',	
// 	type: 'POST',
// 	data: JSON.stringify({ 
// 	    "docId" : "{'2013U0003001106139101','2013U0003001106139102','2013U0003001106139103','2013U0003001106139104'}"
// 	}),
// 	success: function(data){
// 		alert(JSON.stringify(data));
// 	}
// });
	
});
	

 
function fn_sampleInputReset(){
	<itui:submitReset items="${itemInfo.items}" itemOrder="${itemInfo[itemOrderName]}"/>
}	

// 대학 selectbox 세팅
function getCollegeData() {
	try {		
		
		$.ajax({
			url: '/web/haksaCode/getCollegeList.json?mId=192',
		    type: 'POST',
		    crossDomain: true,
		    beforeSend:function(request){
		    	request.setRequestHeader('Ajax','true');
		    }
			}).done(function (data, textStatus, xhr) {
				$("#s_fcltSustCd").children('option:not(:first)').remove();
				$("#s_mjCd").children('option:not(:first)').remove();
				for(var idx in data.haksaCode){
		        	$('#s_colgCd').append("<option value='" + data.haksaCode[idx].DEPT_CD + "'>" + data.haksaCode[idx].DEPT_KOR_NM + "</option>");
		    	}
				setColgCd();
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
			url: '/web/haksaCode/getDeptList.json?mId=192',
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
		        	$('#s_fcltSustCd').append("<option value='" + data.haksaCode[idx].DEPT_CD + "'>" + data.haksaCode[idx].DEPT_KOR_NM + "</option>");
		    	}
				setFcltSustCd();
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
		var fcltSustNm = $('#s_fcltSustCd option:selected').text();
		$.ajax({
			url: '/web/haksaCode/getMajorList.json?mId=192',
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
						$('#s_mjCd').hide();
					 }else{
						$('#s_mjCd option:first').val("");						
					 }
				}else{
					for(var idx in data.haksaCode){						
			        	$('#s_mjCd').append("<option value='" + data.haksaCode[idx].DEPT_CD + "'>" + data.haksaCode[idx].DEPT_KOR_NM + "</option>");
			        	$('#s_mjCd').show();
			    	}					
					setJmCd();
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

function setColgCd(){
	
	// 소속 구분 검색 정보 불러오기
	<c:if test="${!empty param.is_colgCd}">
			var colgCd = '<c:out value="${param.is_colgCd}"/>';
			$("#s_colgCd").val(colgCd).prop("selected",true);
			getDeptData(colgCd);		
	</c:if>


}

function setFcltSustCd(){
	// 대학 검색 정보 불러오기
	<c:if test="${!empty param.is_fcltSustCd}">
			var fcltSustCd = '<c:out value="${param.is_fcltSustCd}"/>';
			$("#s_fcltSustCd").val(fcltSustCd).prop("selected",true);
			getMajorData(fcltSustCd);
	</c:if>
}

function setJmCd(){
		// 학과/전공 검색 정보 불러오기
	<c:if test="${!empty param.is_mjCd}">
		if($('#s_colgCd option:selected').val() != '' && $('#s_fcltSustCd option:selected').val() != ''){
			var mjCd = '<c:out value="${param.is_mjCd}"/>';
			$("#s_mjCd").val(mjCd).prop("selected",true);
		}else{
			$('#s_mjCd').show();
			$("#s_mjCd").children('option:not(:first)').remove();
		}
	</c:if>
}
</script>