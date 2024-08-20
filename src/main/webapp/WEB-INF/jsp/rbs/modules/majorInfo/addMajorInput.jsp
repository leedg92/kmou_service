<%@ include file="../../include/commonTop.jsp"%>
<%@ taglib prefix="itui" tagdir="/WEB-INF/tags/item" %>
<c:set var="itemOrderName" value="${submitType}_order"/>
<itui:submitScript items="${itemInfo.items}" itemOrder="${itemInfo[itemOrderName]}"/>
<script type="text/javascript">
$(function(){
	<itui:submitInit items="${itemInfo.items}" itemOrder="${itemInfo[itemOrderName]}"/>
	fn_sampleInputReset();
	getCollegeData();
	
	var originUrl = window.location.href;
	history.replaceState({path : window.location.pathname},'', window.location.pathname);
	
	$("#refresh").click(function(){
		var confirmVal = confirm("조회 시 입력하시던 정보는 사라집니다. 조회하시겠습니까?");
		
		if(confirmVal){
			window.location.href = originUrl;
		}
	});	
	
	var majorCd = '<c:out value="${param.majorIdx}"/>';
	var year = '<c:out value="${param.yearIdx}"/>';	
	getFieldData(majorCd);
	

	// 검색
	$("#<c:out value="${param.searchFormId}"/>").submit(function(){
		try {
			return fn_sampleInputReset();
		}catch(e){alert(e); return false;}
	});
	
	
	$("#headbox").hide();
	$("#header").hide();
	$("#closebtn").hide();
	$("#lunit").hide();
	
	
	
	
	$("#saveSub").click(function(){
		var jsonString;
		var jsonArray = [];		
		var flag = false;
		var state = false;
		
		$('input:checkbox[name=select]').each(function (index) {			
			if($(this).is(":checked")==true) {
				var obj = {};	
				$(this).closest('tr').find('input').each(function(idx){		
					if(idx > 0) {						
						$('#topfieldset dl select option:selected').each(function(){
							
							obj['FIELD_CD'] = $(this).val();
							obj['FIELD'] = $(this).text();
							if($(this).val() == '') {
								flag = true;
							}
						})
						obj[$(this).attr("name")] = $(this).val();						
					}
				});
				
				if(flag) {
					alert("인재상을 선택해 주세요");
					$(this).focus();
					return false;
				}
				 
				console.log(JSON.stringify(obj));
				jsonArray.push(obj);
			}
			
		})
		
		try {		
			$.ajax({
				url: '${URL_ADD_MAJOR_INPUT}',
			    type: 'POST',
			    crossDomain: true,
			    contentType: 'application/json',
			    data: 
			    	JSON.stringify({"data" : jsonArray})						
			    ,beforeSend:function(request){
			    	request.setRequestHeader('Ajax','true');
			    }
				}).done(function (data, textStatus, error) {
					console.log("ajax 호출 완료" + data);
					
					if(data == null) {
						alert("ok");
						
					} else {
						
						var errObj = JSON.parse(error.responseText);
						
					}
					
					
					
					/* window.close();
					window.opener.location.reload(); */
					
				}).fail(function(data, textStatus, error){
				      /*pass*/
				      /* alert("이미 존재하는 교과목과 전문인 입니다."); */
				      console.log('error 발생 :@@@@@@@ ' + data+ textStatus + error);				      
				      return false;
				});
			state = true;
		} catch(e){
			console.log(e);
			return false;
		}
		
		var index = $("#tpSubContent > tbody > tr").length;
		if(($("#tpSubContent > tbody > tr").length - $("#tpSubContent tr input[name=chkbox]:checked").length) < 1){
			alert("최소 하나의 교과목 행이 있어야 합니다.")
			return false;
		}
		if($("#tpSubContent tbody tr input[name=select]:checked").length == 0){
			alert("추가할 교과목을 선택해주세요.");
			return false;
		}
		
		
		if (state && !flag) {
			window.close();			
			window.opener.location.href = "${URL_MAJOR_LIST}&majorCd=" + majorCd + "&year=" + year;
		}
	});
	
	
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


// 대학 select 변경시
function getDeptData(clsfCd) {
	try {
		$("#yearbox").hide();
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
		$("#yearbox").hide();
		var fcltSustCd = $('#s_fcltSustCd').val();
		var fcltSustNm = $('#s_fcltSustCd option:selected').text();
		var fcltSustEngNm = $('#s_fcltSustCd option:selected').attr('deptnmeng');
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
						$('#mjNmKor').val(fcltSustNm);
						$('#mjNmEng').val(fcltSustEngNm);
						getRegisteredYear(fcltSustCd);
						$("#yearbox").show();
						$("#s_mjCd").hide();
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
function getRegisteredYear(value){
	$("#year option").each(function(){				
  			var optionVal = $(this).val();
  			if(optionVal == ""){
  				optionVal = '연도 선택';
  			}
			$(this).prop('disabled', false).text(optionVal);
		});	
	$.ajax({
		url: '${URL_REGISTERED_YEAR}',
	    type: 'GET',
	    crossDomain: true,
	    data: {
	    	mjCd : value
  		},
  		success:function(data){
  			$("#year option").prop('disabled', false);
  			var registeredYearList = [];
  			
  			for(var i=0; i < data.registeredYearList.length; i++){
  				registeredYearList.push(data.registeredYearList[i].YY)
  			}
  			
  			$("#year option").each(function(){
  	  			var optionVal = $(this).val();
  					if(registeredYearList.includes(optionVal)){
  						$(this).prop('disabled', true).text(optionVal + "(등록됨)");
  					}else{
//   						$(this).prop('disabled', false).text(optionVal);
  					}
  			});



  		},
  		error:function(e){
  			alert(JSON.stringify(e))
  		}
		})

}

//인재상 리스트 불러오기
function getFieldData(majorCd) {
	
	try {		
		$.ajax({
			url: '/web/majorInfo/getFieldList.json?mId=44',
		    type: 'POST',
		    crossDomain: true,
		    data: {
		    	majorCd : majorCd
	  		},
		    beforeSend:function(request){
		    	request.setRequestHeader('Ajax','true');
		    }
			}).done(function (data, textStatus, xhr) {
				fieldList = data.fieldList;							
					
	  			for(var i=0; i < fieldList.length; i++){
  					$('#s_field').append("<option name='FIELD' value='" + fieldList[i].OPTION_CODE + "'>" + fieldList[i].OPTION_NAME + "</option>");
		    	}
	  			/* if ($("#sptPsnKor").val() == $('#s_sptPsnKor').val()) {
	  				$('#sptPsnKor').val($('#s_sptPsnKor' + 'option:selected').text());
	  			} */
				
			})
			.fail(function(data, textStatus, errorThrown){
			      /*pass*/
			      alert(JSON.stringify(e))
			});
	} catch(e){
		console.log(e);
	}	
}
</script>