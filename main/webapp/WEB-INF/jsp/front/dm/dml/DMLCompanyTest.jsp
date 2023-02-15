<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>구글 차트 : 컬럼차트 : 컬럼차트 기초 그리고 시작</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>

<div style="text-align:center; margin:0 0 100px 0; background:#555; line-height:80px;">
	<a style="color:#fff; font-weight:bold; font-family:tahoma; font-size:20pt;" href="https://ktsmemo.cafe24.com/s/GoogleChart/85" target="_blank">https://ktsmemo.cafe24.com/s/GoogleChart/85</a>
</div>


<!-- 예제 시작 -->

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
	// 차트를 사용하기 위한 준비입니다.
	google.charts.load('current', {packages:['corechart']});
</script>

<div id="chart_div"></div><!-- 여기에 차트가 생성됩니다. -->

<script>

// 로딩 완료시 함수 실행하여 차트 생성
google.charts.setOnLoadCallback(drawChart);

function drawChart() {
	// 차트 데이터 설정
	var data = google.visualization.arrayToDataTable([
		['항목', '다리수'], // 항목 정의
		['고양이', 4], // 항목, 값 (값은 숫자로 입력하면 그래프로 생성됨)
		['메뚜기', 6],
		['문어', 8],
		['오징어', 10],
		['운영자', 2],
		['달팽이', 0], // ?
		['랜덤', Math.round(Math.random() * 10)],
	]);

	// 그래프 옵션
	var options = {
		title : '다리 갯수', // 제목
		width : 600, // 가로 px
		height : 400, // 세로 px
		bar : {
			groupWidth : '80%' // 그래프 너비 설정 %
		},
		legend : {
			position : 'none' // 항목 표시 여부 (현재 설정은 안함)
		}
	};

	var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
	chart.draw(data, options);
}

</script>

<!-- 예제 종료 -->


</body>
</html>