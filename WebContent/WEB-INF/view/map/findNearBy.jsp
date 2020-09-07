<%@page import="kosmo62.spomatch.kmap.vo.SpoKmapVO"%>

<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>운동장 조회</title>
<style>
#mapwrap {
	position: relative;
	overflow: hidden;
}

.category, .category * {
	margin: 0;
	padding: 0;
	color: #000;
}

.category {
	position: absolute;
	overflow: hidden;
	top: 10px;
	left: 10px;
	width: auto;
	height: 55px;
	z-index: 10;
	border: 1px solid black;
	font-family: 'Malgun Gothic', '맑은 고딕', sans-serif;
	font-size: 12px;
	text-align: center;
	background-color: #fff;
}

<
.category .menu_selected {
	background: #FF5F4A;
	color: #fff;
	border-left: 1px solid #915B2F;
	border-right: 1px solid #915B2F;
	margin: 0 -1px;
}

.category li {
	list-style: none;
	float: left;
	width: 50px;
	height: 45px;
	padding-top: 5px;
	cursor: pointer;
}

.category .ico_comm {
	display: block;
	margin: 0 auto 2px;
	width: 22px;
	height: 26px;
	
}

.category .ico_footsal {
	background-position: 0px -23px;
    background-image: url(img/map/footsal_icon.png);
    background-size: 22px 23px;
	
}

.category .ico_health {
	background-position: -1px -24px;
    background-image: url(img/map/health_icon.png);
    background-size: 24px 25px;
}

.category .ico_carpark {
	background-position: -1px -23px;
    background-image: url(img/map/carpark_icon.png);
    background-size: 24px 24px;
}
.category .ico_all {
	background-position: 0px -22px;
    background-image: url(img/map/all_icon.png);
    background-size: 22px 23px;
}
 #keyword{
 	border: none;
    border-right: 0px;
    border-top: 0px;
    
    margin-top: 50px;
    height: 36;
    background-color: white;
}
.btn1{
border: none;
    border-right: 0px;
    border-top: 0px;
    color: var(--black);
    width : 60;
   	height: 36;
   background-color : #EFEFEF;
}
#search_btn{
  border-right: 0px;
    border-top: 0px;
	background-color: white;
	background-color : #EFEFEF;
	color: var(--black);
	border-style: none;
	margin: 0px 10px;
}
.sub_category_subject h1 {
    float: none;
    padding-bottom: 10px;
    margin-bottom: 30px;
    border-bottom: 2px solid black;
}
</style>
<div class="sub_category_subject">
	<h1 onclick="dbData2()" > 근처찾기</h1>
</div>
<div id="mapwrap">

	<!-- 지도가 표시될 div -->

	<div id="map" style="width: 100%; height: 350px;"></div>

	<!-- 지도 위에 표시될 마커 카테고리 -->

	<div class="category">

		<ul>
			<li id="healthMenu"><span class="ico_comm ico_health"></span>
				헬스장</li>

			<!--<li id="footsalMenu" onclick="changeMarker('footsal')">-->

			<li id="footsalMenu"><span class="ico_comm ico_footsal"></span>

				풋살장</li>

			<!--<li id="carparkMenu" onclick="changeMarker('carpark')"> -->

			<li id="carparkMenu"><span class="ico_comm ico_carpark"></span>

				주차장</li>
		

		</ul>

	</div>
	</div>

<div id="map" style="width: 50%; height: 300px;"></div>



<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e3e734327f9b7229d3c34ff48d390d66"></script>

<script type="text/javascript">

//주차장 마커가 카테고리 width값 안에 못들어와서 카테고리 width갑임의로 늘림
	// ajax로 가져온 데이터 전역변수화

	var ajaxData;

	$(document).ready(function(){

		dbData2();

	});



	
	//검색기능 조회부분에 function

	//========================Ajax로 DB값 가져오기 ========================================

	function dbData2() {

		console.log("dbData2() >>>> : ");

		//지도상에 검색한 마커들이 쌓이는걸 방지하기위해서
		// 관리자 모드에 img가 생기는 영역을 찾아서 remove.
		$("#map").children().children().children().eq(5).children().remove();
		
	
		var url = "/spoMatch/kakaoMapData.spo";

		$.ajax({

			url : url,

			

			dataType : "json",//객체값으로 컨텐트값을 넘기면 data

			cache : false, //ajax로 통신중 캐시가 남아서 갱신된 데이터를 받아오지 못하는경우

			success : function(data) {

				ajaxData = data

				console.log(data);

				makingHealth(data);

				makingFootsal(data);

				makingPark(data);

				// 풋살장 카테고리를 선택된 스타일로 변경하고

				footsalMenu.className = '';

				healthMenu.className = 'menu_selected';

				carparkMenu.className = '';

				// 편의점 마커들만 지도에 표시하도록 설정합니다

				setFootsalMarkers(null);

				setHealthMarkers(map);

				setCarparkMarkers(null);

				createHealthMarkers(); // 헬스장 마커를 생성하고 편의점 마커 배열에 추가합니다

				createFootsalMarkers(); // 풋살장 마커를 생성하고 커피숍 마커 배열에 추가합니다

				createCarparkMarkers(); // 주차장 마커를 생성하고 주차장 마커 배열에 추가합니

			},

			error : function() {

				alert("error");

			}

		});

	}

	//========================Map 출력 =================================================

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  

	mapOption = {

		center : new kakao.maps.LatLng(37.478898, 126.879050), // 지도의 중심좌표

		level : 7
	// 지도의 확대 레벨

	};

	// 지도를 생성합니다

	var map = new kakao.maps.Map(mapContainer, mapOption);

	function newMap() {
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  

		mapOption = {

			center : new kakao.maps.LatLng(37.478898, 126.879050), // 지도의 중심좌표

			level : 7

		};

		var map = new kakao.maps.Map(mapContainer, mapOption);

	}

	//===============================헬스장 마커 표시======================================//

	var healthPositions = [];

	console.log(" healthPositions >>>" + healthPositions);

	function makingHealth(data) {

		console.log("data >>> : " + data);

		console.log("makingHealth 진입 >>> : ");

		for (var i = 0; i < data.length; i++) {

			if (data[i].content == "헬스장") {

				healthPositions[i] = new kakao.maps.LatLng(
						parseFloat(data[i].x), parseFloat(data[i].y));

			}

		}

	}

	console.log("result >>> : " + healthPositions);

	//===============================풋살장 마커 표시 ======================================		

	//풋살장 마커가 표시될 좌표 배열입니다.

	var footsalPositions = [];

	function makingFootsal(data) {

		console.log("makingFootsal 진입 >>> : ");

		for (var i = 0; i < data.length; i++) {

			if (data[i].content == "풋살장") {

				footsalPositions.push(new kakao.maps.LatLng(
						parseFloat(data[i].x), parseFloat(data[i].y)));

			}

		}

	}

	console.log(footsalPositions);

	//================================주차장 마커 표시========================================

	// 주차장 마커가 표시될 좌표 배열입니다

	var carparkPositions = null;

	carparkPositions = [];

	function makingPark(data) {

		console.log("makingPark 진입 >>> : ");

		for (var i = 0; i < data.length; i++) {

			if (data[i].content == "주차장") {

				carparkPositions.push(new kakao.maps.LatLng(
						parseFloat(data[i].x), parseFloat(data[i].y)));

			}

		}

	}
	console.log(carparkPositions);

	var markerImageSrc1 = 'img/map/health_icon.png';
	var markerImageSrc2 = 'img/map/footsal_icon.png';
	var markerImageSrc3 = 'img//map/carpark_icon.png';

	healthMarkers = [], // 헬스장 마커 객체를 가지고 있을 배열입니다

	footsalMarkers = [], // 풋살장 마커 객체를 가지고 있을 배열입니다

	carparkMarkers = []; // 주차장 마커 객체를 가지고 있을 배열입니다

	createHealthMarkers(); // 헬스장 마커를 생성하고 헬스장 마커 배열에 추가합니다

	createFootsalMarkers(); // 풋살장 마커를 생성하고 풋살장 마커 배열에 추가합니다

	createCarparkMarkers(); // 주차장 마커를 생성하고 주차장 마커 배열에 추가합니다

	// changeMarker('health'); // 지도에 풋살장 마커가 보이도록 설정합니다    

	// 마커이미지의 주소와, 크기, 옵션으로 마커 이미지를 생성하여 리턴하는 함수입니다

	function createMarkerImage(src, size, options) {

		var markerImage = new kakao.maps.MarkerImage(src, size, options);

		return markerImage;

	}

	// 좌표와 마커이미지를 받아 마커를 생성하여 리턴하는 함수입니다

	function createMarker(position, image, ajaxData2) {

		console.log(position);
		var marker = new kakao.maps.Marker({

			position : position,
			clickable : true,
			image : image

		});
		marker.setMap(map);

		// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
		console.log(" 마커생성메소드안 dataFromAjax >>>> : ", ajaxData2);

		iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow(
				{
					content : ajaxData2.name
							+ "<br>"
							+ ajaxData2.hp
							+ '<div style="padding:10px;"><a href="https://map.kakao.com/link/map/Hello World!" style="color:blue" target="_blank">지도보기</a> <a href="https://map.kakao.com/link/to/Hello World!" style="color:blue" target="_blank">길찾기</a></div>',
					removable : iwRemoveable
				});

		// 마커에 클릭이벤트를 등록합니다
		kakao.maps.event.addListener(marker, 'click', function() {
			// 마커 위에 인포윈도우를 표시합니다
			infowindow.open(map, marker);
		});

		return marker;

	}

	//=======================헬스장 마커를 생성하고 헬스장 마커 배열에 추가하는 함수입니다===================================

	function createHealthMarkers() {

		for (var i = 0; i < healthPositions.length; i++) {

			var imageSize = new kakao.maps.Size(22, 26),

			imageOptions = {
	
				//사진 위치
				spriteOrigin : new kakao.maps.Point(0, 0),
				// 사진 사이즈
				spriteSize : new kakao.maps.Size(22, 22)

			};

			// 마커이미지와 마커를 생성합니다

			var markerImage = createMarkerImage(markerImageSrc1, imageSize,
					imageOptions),

			marker = createMarker(healthPositions[i], markerImage, ajaxData[i]);

			// 생성된 마커를 헬스장 마커 배열에 추가합니다

			healthMarkers.push(marker);

		}

	}

	// 헬스장 마커들의 지도 표시 여부를 설정하는 함수입니다

	function setHealthMarkers(map) {

		for (var i = 0; i < healthMarkers.length; i++) {

			healthMarkers[i].setMap(map);

		}

	}

	// ===========================풋살장 마커를 생성하고 풋살장 마커 배열에 추가하는 함수입니다=================================

	function createFootsalMarkers() {

		for (var i = 0; i < footsalPositions.length; i++) {

			var imageSize = new kakao.maps.Size(22, 26),

			imageOptions = {
	
				//사진 위치
				spriteOrigin : new kakao.maps.Point(0, 0),
				// 사진 사이즈
				spriteSize : new kakao.maps.Size(22, 22)

			};

			// 마커이미지와 마커를 생성합니다

			var markerImage = createMarkerImage(markerImageSrc2, imageSize,
					imageOptions),

			marker = createMarker(footsalPositions[i], markerImage,ajaxData[i]);

			// 생성된 마커를 커피숍 마커 배열에 추가합니다

			footsalMarkers.push(marker);

		}

	}

	//풋살장 마커들의 지도 표시 여부를 설정하는 함수입니다

	function setFootsalMarkers(map) {

		for (var i = 0; i < footsalMarkers.length; i++) {

			footsalMarkers[i].setMap(map);

		}

	}

	//=====================주차장 마커를 생성하고 주차장 마커 배열에 추가하는 함수입니다================================

	function createCarparkMarkers() {

		for (var i = 0; i < carparkPositions.length; i++) {

			var imageSize = new kakao.maps.Size(22, 26),

			imageOptions = {
	
				//사진 위치
				spriteOrigin : new kakao.maps.Point(-2, 0),
				// 사진 사이즈
				spriteSize : new kakao.maps.Size(20, 22)


			};

			// 마커이미지와 마커를 생성합니다

			var markerImage = createMarkerImage(markerImageSrc3, imageSize,
					imageOptions),

			marker = createMarker(carparkPositions[i], markerImage,ajaxData[i]);

			// 생성된 마커를 주차장 마커 배열에 추가합니다

			carparkMarkers.push(marker);

		}

	}

	// 주차장 마커들의 지도 표시 여부를 설정하는 함수입니다

	function setCarparkMarkers(map) {

		for (var i = 0; i < carparkMarkers.length; i++) {

			

			carparkMarkers[i].setMap(map);

		}

	}

	//================================= 카테고리를 클릭했을 때 type에 따라 카테고리의 스타일과 지도에 표시되는 마커를 변경합니다

	$('#healthMenu').click(function() {

		// 편의점 카테고리를 선택된 스타일로 변경하고

		footsalMenu.className = '';

		healthMenu.className = 'menu_selected';

		carparkMenu.className = '';

		// 편의점 마커들만 지도에 표시하도록 설정합니다

		setFootsalMarkers(null);

		setHealthMarkers(map);

		setCarparkMarkers(null);

	});

	$('#footsalMenu').click(function() {

		// 커피숍 카테고리를 선택된 스타일로 변경하고

		footsalMenu.className = 'menu_selected';

		// 편의점과 주차장 카테고리는 선택되지 않은 스타일로 바꿉니다

		healthMenu.className = '';

		carparkMenu.className = '';

		// 커피숍 마커들만 지도에 표시하도록 설정합니다

		setFootsalMarkers(map);

		setHealthMarkers(null);

		setCarparkMarkers(null);

	});

	
	$('#carparkMenu').click(function() {

		// 주차장 카테고리를 선택된 스타일로 변경하고

		footsalMenu.className = '';

		healthMenu.className = '';

		carparkMenu.className = 'menu_selected';

		// 주차장 마커들만 지도에 표시하도록 설정합니다

		setFootsalMarkers(null);

		setHealthMarkers(null);

		setCarparkMarkers(map);

	});
</script>

</head>
<body>

</body>
</html>

