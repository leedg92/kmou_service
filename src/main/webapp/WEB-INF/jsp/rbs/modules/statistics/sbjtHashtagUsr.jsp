<%@ include file="../../include/commonTop.jsp"%>
<link rel="stylesheet" type="text/css" href="/include/js/calendar/calendar.css">
<script type="text/javascript" src="/include/js/calendar.js"></script>
<script type="text/javascript" src="<c:out value="${contextPath}/include/js/Chart.min.js"/>"></script>
<script type="text/javascript" src="<c:out value="${contextPath}/include/js/chartjs-plugin-doughnutlabel.min.js"/>"></script>
<script type="text/javascript" src="<c:out value="${contextPath}/include/js/all.js"/>"></script>
<script type="text/javascript" src="<c:out value="${contextPath}/include/js/moment.js"/>"></script>
<style type="text/css">
.page {display:flex;justify-content: center;margin:40px 0;}
.page a {position:relative;display:flex;align-items: center;justify-content: center;margin:2px 2px;width:30px;height:30px;font-size:14px;color:#555;vertical-align:middle;text-decoration:none;background:#fff;border:1px solid #d7d7d7}
.page a.on {color:#fff;background:#f48168;border:1px solid #f48168;z-index:2}
</style>
<script type="text/javascript">
$(function(){
    setForm();
    getData();
});

// 전역 변수로 차트를 저장할 변수 선언
let chart;

function setForm() {

    var today = new Date();
    var todayYear    = today.getFullYear();
    var todayMonth    = today.getMonth() + 1;
    var todayDate    = today.getDate();

    for (var year = 2016; year <= todayYear; year++) {
        var selected = year == todayYear ? 'selected' : '';
        $('#searchStatsDate1').append('<option value="'+year+'" '+selected+'>'+year+'</option>');
    }
    for (var month = 1; month <= 12; month++) {
        var selected = month == todayMonth ? 'selected' : '';
        $('#searchStatsDate2').append('<option value="'+(month < 10 ? '0'+month : month)+'" '+selected+'>'+month+'</option>');
    }
    for (var date = 1; date <= 31; date++) {
        var selected = date == todayDate ? 'selected' : '';
        $('#searchStatsDate3').append('<option value="'+(date < 10 ? '0'+date : date)+'" '+selected+'>'+date+'</option>');
    }

    $('#searchStatsType').on('change', function(){

        var value = $(this).val();

        if (value == '1') {
            $('#searchStatsDate1, #searchStatsDate2, #searchStatsDate3').prop('disabled', true);
        }
        if (value == '2'){
            $('#searchStatsDate1').prop('disabled', false);
            $('#searchStatsDate2, #searchStatsDate3').prop('disabled', true);
        }
        if (value == '3'){
            $('#searchStatsDate1, #searchStatsDate2').prop('disabled', false);
            $('#searchStatsDate3').prop('disabled', true);
        }
        if (value == '4'){
            $('#searchStatsDate1, #searchStatsDate2, #searchStatsDate3').prop('disabled', false);
        }
    });
}

function getData() {
    try {
        $.ajax({
            beforeSend:function(request){request.setRequestHeader('Ajax', 'true');},
            url:"${URL_HASHTAG_USR_DATA}",
            data: $('#searchForm').serialize(),
            success:function(data){
                if (data.status != 1) return false;

                setChart(data.chartData);
                return true;
            },
            error: function(x, y, z){
                console.log(x, y, z);
                return false;
            }
        });
    } catch(e){
        console.log(e);
        return false;
    }
}

function setChart(data) {
    if (chart) chart.destroy(); // 기존 차트가 있으면 삭제

    var ctx = document.getElementById('chartBox').getContext('2d');
    var hours = data.map(item => item.REGI_DATE);
    var counts = data.map(item => item.CNT);
    
    chart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: hours,
            datasets: [{
                label: '사용자수',
                data: counts,
                backgroundColor: '#4472c4',
                borderColor: '#4472c4',
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: { display: false },
                tooltip: {
                    callbacks: {
                        label: function(context) {
                            return context.parsed.y + '명';
                        }
                    }
                }
            },
            scales: {
                x: { title: { display: true, text: '시간' }, beginAtZero: true },
                y: { title: { display: true, text: '사용자 수' }, beginAtZero: true }
            }
        }
    });
}
</script>
