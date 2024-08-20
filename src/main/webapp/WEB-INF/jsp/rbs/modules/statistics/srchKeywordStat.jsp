<%@ include file="../../include/commonTop.jsp"%>
<link rel="stylesheet" type="text/css" href="/include/js/calendar/calendar.css">
<script type="text/javascript" src="/include/js/calendar.js"></script>
<style type="text/css">
.page {display:flex;justify-content: center;margin:40px 0;}
.page a {position:relative;display:flex;align-items: center;justify-content: center;margin:2px 2px;width:30px;height:30px;font-size:14px;color:#555;vertical-align:middle;text-decoration:none;background:#fff;border:1px solid #d7d7d7}
.page a.on {color:#fff;background:#f48168;border:1px solid #f48168;z-index:2}
</style>
<script type="text/javascript">
var isPageLoad = true; // 페이지 초기 로드를 표시하는 플래그



$(function(){
	//페이지 로드 시 달력에 넣을 날짜정보
	setForm();
    // 페이지 로드 시 대학 목록 불러오기
    getCollList();
    
    // 학부(과)목록 불러오기(대학 선택시) - 전공교과목
    $("#selectColg").on('change', function(){
        if (!isPageLoad) {
            // 대학이 변경될 때 학부/학과와 전공의 세션 스토리지 값을 지움
            sessionStorage.removeItem('selectDept');
            sessionStorage.removeItem('selectMj');
        }
        $('#selectMj option:not(:first)').remove();
		if($(this).val() != ''){
	        $.ajax({
	            url : '/web/studPlan/getDeptList.do?mId=36',
	            beforeSend:function(request){request.setRequestHeader('Ajax', 'true');},
	            contentType:'application/json',
	            type:'GET', 
	            data: { 
	                univ : $(this).val()
	            },
	            success:function(data){
	                var items = data.DEPART_LIST;
	                var html = '<option value="">학부(과)</option>';
	                
	                for(var i=0; i < items.length; i++){
	                    html += '<option value="'+items[i].DEPT_CD+'">'+items[i].DEPT_NM+'</option>'
	                }
	                
	                $('#selectDept').html(html);
	
	                // 페이지 로드 시에만 세션 스토리지에 저장된 학부/학과 값 설정
	                if (isPageLoad && sessionStorage.getItem('selectDept')) {
	                    setTimeout(function() {
	                        $('#selectDept').val(sessionStorage.getItem('selectDept')).trigger('change');
	                    }, 0);
	                }
	            }
	        });
			
		}else{
            var html = '<option value="">학부(과)</option>';            
            $('#selectDept').html(html);
            $('#selectMj').show();
		}
    });
    
    // 전공목록 불러오기(학부 선택시) - 전공교과목
    $("#selectDept").on('change', function(){
        var selectedDept = $("#selectDept option:selected").text();
        var lastTwoChars = selectedDept.slice(-2);
        
        if (lastTwoChars === '학과' || lastTwoChars === '전공') {
            $('#selectMj').hide();
        } else {
            $('#selectMj').show();
            if($(this).val() != ''){            
	            $.ajax({
	                url : '/web/studPlan/getMajorList.do?mId=36',
	                beforeSend:function(request){request.setRequestHeader('Ajax', 'true');},
	                contentType:'application/json',
	                type:'GET', 
	                data: { 
	                    depart : $(this).val()
	                },
	                success:function(data){
	                    var items = data.MAJOR_LIST;
	                    var html = '<option value="">전공</option>';
	                    
	                    for(var i=0; i < items.length; i++){
	                        html += '<option value="'+items[i].DEPT_CD+'">'+items[i].DEPT_NM+'</option>'
	                    }
	                    
	                    $('#selectMj').html(html);
	
	                    // 페이지 로드 시에만 세션 스토리지에 저장된 전공 값 설정
	                    if (isPageLoad && sessionStorage.getItem('selectMj')) {
	                        setTimeout(function() {
	                            $('#selectMj').val(sessionStorage.getItem('selectMj'));
	                            isPageLoad = false; // 초기 로드 완료 후 플래그 변경
	                        }, 0);
	                    } else {
	                        isPageLoad = false; // 초기 로드 완료 후 플래그 변경
	                    }
	                }
	            });
            }else{
                var html = '<option value="">전공</option>';
                $('#selectMj').html(html);
            }
        }
    });
    
    // 검색 버튼 클릭 시
    $("#fn_btn_search").click(function() {
        var selectedBox = ($("#selectMj").val() != "" ? $("#selectMj").val() : ($("#selectDept").val() != "" ? $("#selectDept").val() : ($("#selectColg").val() != "" ? $("#selectColg").val() : "")));
        
        // 세션 스토리지 초기화
        sessionStorage.removeItem('selectColg');
        sessionStorage.removeItem('selectDept');
        sessionStorage.removeItem('selectMj');
        
        // 세션 스토리지 저장
        sessionStorage.setItem('selectColg', $('#selectColg').val());
        sessionStorage.setItem('selectDept', $('#selectDept').val());
        sessionStorage.setItem('selectMj', $('#selectMj').val());
        
        $("input[name=SEL_RANGE]").val(selectedBox);
    });
});

function getCollList(){
    // 대학 목록 불러오기
    $.ajax({
        url: '/web/studPlan/getCollList.do?mId=36',
        beforeSend:function(request){request.setRequestHeader('Ajax', 'true');},
        contentType:'application/json',
        type:'GET', 
        data: { 
            sbjtDgnRngFg : ''
        },
        success:function(data){
            
            // 대학
            if($("#selectColg").children().length == 0){
                var rs = data.COLLEGE_LIST;
                var html = '<option value="">대학</option>';
                
                for(var i=0; i < rs.length; i++){
                    html += '<option value="'+rs[i].DEPT_CD+'">'+rs[i].DEPT_NM+'</option>'
                }
                $('#selectColg').html(html);
            }
            
            // 세션 스토리지에 저장된 대학 값 설정 및 change 트리거
            if (sessionStorage.getItem('selectColg')) {
                $('#selectColg').val(sessionStorage.getItem('selectColg')).trigger('change');
            } else {
                isPageLoad = false; // 초기 로드 완료 후 플래그 변경
            }
        }
    });
}


function getData() {
	var today = new Date();
	var todayYear  = today.getFullYear();
	var todayMonth = ("0" + (1 + today.getMonth())).slice(-2);
	var todayDate  = ("0" + today.getDate()).slice(-2);
	var endDate = todayYear + '-' + todayMonth + '-' + todayDate;
	$("[id^='searchEdDt']").val(endDate);

	var monthAgo = new Date();
	monthAgo.setMonth(today.getMonth() - 1);
	var monthAgoYear  = monthAgo.getFullYear();
	var monthAgoMonth = ("0" + (1 + monthAgo.getMonth())).slice(-2);
	var monthAgoDate  = ("0" + monthAgo.getDate()).slice(-2);
	var startDate = monthAgoYear + '-' + monthAgoMonth + '-' + monthAgoDate
	$("[id^='searchStDt']").val(startDate);

	

	// 달력 선택
	try {
		$("[id^='btnSearchStDt'], [id^='searchStDt']").click(function(event){
			var index = $(this).attr("id").split("_")[1];
			displayCalendar2($('#searchStDt_' + index), $('#searchEdDt_' + index), '', this);
			return false;
		});
		$("[id^='btnSearchEdDt'], [id^='searchEdDt']").click(function(event){
			var index = $(this).attr("id").split("_")[1];
			displayCalendar2($('#searchEdDt_' + index), $('#searchStDt_' + index), '', this);
			return false;
		});
	} catch(e){
		console.log(e);
	}

	
}


function setForm() {

	var today = new Date();
	var todayYear  = today.getFullYear();
	var todayMonth = ("0" + (1 + today.getMonth())).slice(-2);
	var todayDate  = ("0" + today.getDate()).slice(-2);
	if ('${param.searchStDt}' == '' && '${param.searchEdDt}' == '') $('#searchEdDt').val(todayYear + '-' + todayMonth + '-' + todayDate);

	var monthAgo = new Date();
		monthAgo.setMonth(today.getMonth() - 1);
	var monthAgoYear  = monthAgo.getFullYear();
	var monthAgoMonth = ("0" + (1 + monthAgo.getMonth())).slice(-2);
	var monthAgoDate  = ("0" + monthAgo.getDate()).slice(-2);
	if ('${param.searchStDt}' == '' && '${param.searchEdDt}' == '') $('#searchStDt').val(monthAgoYear + '-' + monthAgoMonth + '-' + monthAgoDate);

	try {
		$("#btnSearchStDt, #searchStDt").click(function(event){
			displayCalendar2($('#searchStDt'), $('#searchEdDt'), '', this);
			return false;
		});
		$("#btnSearchEdDt, #searchEdDt").click(function(event){
			displayCalendar2($('#searchEdDt'), $('#searchStDt'), '', this);
			return false;
		});
	} catch(e){
		console.log(e);
	}

	try {
		$.ajax({
			beforeSend:function(request){request.setRequestHeader('Ajax', 'true');},
			url:"${URL_SRCH_KEYWORD_STAT_FORM}",
			async: true,
			success:function(data){
				univCodeList = data.univCodeList;
				agmtCodeList = data.agmtCodeList;
				univPartCodeList = data.univPartCodeList;
				agmtPartCodeList = data.agmtPartCodeList;

				$('#searchCamp').on('change', function(){

					var codeList = $(this).val() == '0000587' ? univCodeList : $(this).val() == '0000601' ? agmtCodeList : null;

					$('#searchUniv').empty();
					$('#searchUniv').append('<option value="" selected>전체</option>');
					$('#searchDept').empty();
					$('#searchDept').append('<option value="" selected>전체</option>');
					codeList.forEach(function(obj){
						$('#searchUniv').append('<option value="'+obj.DEPT_CD+'">'+obj.DEPT_NM+'</option>');
					});

					campCodeStat = $(this).val();
					univCodeStat = '';
				});

				$('#searchUniv').on('change', function(){

					var codeList;

					if (campCodeStat == '0000587') codeList = univPartCodeList.filter((x) => x.UP_DEPT_CD == $(this).val());
					if (campCodeStat == '0000601') codeList = agmtPartCodeList.filter((x) => x.UP_DEPT_CD == $(this).val());

					$('#searchDept').empty();
					$('#searchDept').append('<option value="" selected>전체</option>');
					codeList.forEach(function(obj){
						$('#searchDept').append('<option value="'+obj.DEPT_CD+'">'+obj.DEPT_NM+'</option>');
					});

					univCodeStat = $(this).val();
				});

				if ('${param.searchCamp}' != '') {
					$('#searchCamp').val('${param.searchCamp}');
					var selectCamp = document.getElementById('searchCamp');
					var event = new Event('change', { bubbles: true });
					selectCamp.dispatchEvent(event);

					if ('${param.searchUniv}' != '') {
						$('#searchUniv').val('${param.searchUniv}');
						var selectUniv = document.getElementById('searchUniv');
						var event = new Event('change', { bubbles: true });
						selectUniv.dispatchEvent(event);

						if ('${param.searchDept}' != '') {
							$('#searchDept').val('${param.searchDept}');
						}
					}
				}
			},
			error: function(x, y, z){
				console.log(x, y, z);
			}
		});
	} catch(e){
		console.log(e);
	}
}
</script>