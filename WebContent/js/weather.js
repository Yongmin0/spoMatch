'use strict'
const currentWeather_Lo = document.querySelector('.weather__current__lo');
const currentWeather_Temp = document.querySelector('.weather__current__tem');
const currentWeatherId = document.querySelector('.weather__current__id');
const currentWeatherIcon = document.querySelector('.weather__current__icon');

const forecast = document.querySelector('.weather__forecast');
const weatherIconUrl = 'http://openweathermap.org/img/wn/';
//API KEY
const API_KEY = "d5a28e51c633a95f924f39b59a2c8c75";
//좌표
const COORDS = "coords";

/*const part = "daily";*/

function getWeather(lat, lon){
    fetch(
        `https://api.openweathermap.org/data/2.5/onecall?lat=${lat}&lon=${lon}&exclude=hourly&appid=${API_KEY}&units=metric`
    ).then(function(response){
        return response.json();
    }).then(function(json){
        //==========================현재===========================
        //지역
        const currentPlace = json.timezone;
        console.log('currentPlace >>> : ' + currentPlace);
        const currrentPlaceKor = loEngToKor(currentPlace);
        //온도
        const currentTemp = json.current.temp;
        //id
        const currentId = json.current.weather[0].id;
        console.log('currentId >>> : ' + currentId);
        const currentIdKor = wDescEngToKor(currentId);
        console.log('currentIdKor >>> : ' + currentIdKor);
        //아이콘
        const currentWeatherArray = json.current.weather[0];
        console.log('currentWeatherArray.main >>> : ' + currentWeatherArray.id);
        console.log('currentWeatherArray.icon >>> : ' + currentWeatherArray.icon);
        //아이콘 세팅
        const currentWeatherIconResult = weatherIconUrl + currentWeatherArray.icon + '.png';
        console.log('weatherIconResult >>> : ' + currentWeatherIconResult);
        //현재날씨 아이콘 출력
        currentWeatherIcon.setAttribute('src', currentWeatherIconResult);
        //현재 지역 출력
        currentWeather_Lo.innerText = `${currrentPlaceKor}`;
        //현재 온도 출력
        currentWeather_Temp.innerText = `${currentTemp}°C`;
        //id값 출력
        currentWeatherId.innerText = `${currentIdKor}`;


        //============================7일예보======================
        //예보아이콘
        for(var i=0; i <= 6; i++){
            console.log('dailyIcon.icon >>> : ' + json.daily[i].weather[0].icon);
            console.log('weatherIconUrl + json.daily[i].weather[0].icon.png >>> : ' + weatherIconUrl + json.daily[i].weather[0].icon + '.png');
            //Tag 생성
            var div = document.createElement('div');
            var img = document.createElement('img');
            var ul = document.createElement('ul');
            var li1 = document.createElement('li');
            var li2 = document.createElement('li');
            var li3 = document.createElement('li');
            //ChileNode 주입
            forecast.appendChild(div);
            div.setAttribute('class', 'forecasst__weather' + [i]);
            div.appendChild(img);
            div.appendChild(ul);
            ul.appendChild(li1);
            li1.setAttribute('class', 'forecasst__weather__item1');
            ul.appendChild(li2);
            li2.setAttribute('class', 'forecasst__weather__item2');
            /*ul.appendChild(li3);
            li3.setAttribute('class', 'forecasst__weather__item3');*/
            //아이콘 출력
            img.setAttribute('src',  weatherIconUrl + json.daily[i].weather[0].icon + '.png');
            img.style.width = "50px";
            img.style.height = "50px";
            //예보 날짜 출력
            li1.innerText = `${new Date(json.daily[i].dt * 1000).getDate()}일`;
            //예보 온도 출력
            li2.innerText = `${json.daily[i].temp.day}°C`;
            //예보 기상 상태 출력
            /*const forecastId = wDescEngToKor(json.daily[i].weather[0].id);
            console.log('forecastId >>> : ' + forecastId);
            li3.innerText = `${forecastId}`;*/
        }
    });
}

function saveCoords(coordsObj){
    localStorage.setItem(COORDS, JSON.stringify(coordsObj));
}

function handleGeoSucces(position){
    const latitude = position.coords.latitude;
    const longitude = position.coords.longitude;
    const coordsObj = {
        latitude: latitude,
        longitude: longitude
    };
    saveCoords(coordsObj);
    getWeather(latitude, longitude);
    console.log(getWeather);
}

function handleGeoError(position){
    console.log('Cant access geo location');
}

//좌표 요청하는 함수
function askForCoords(){
    navigator.geolocation.getCurrentPosition(handleGeoSucces, handleGeoError);
}

//좌표 불러오기
function loadCoords(){
    const loadedCoords = localStorage.getItem(COORDS);
    //좌표값이 null인 경우 좌표값을 묻는 askForCoords() 함수가 실행된다.
    if(loadedCoords === null){
        askForCoords();
    }else{
        //날씨 데이터 가져오기
        const parsedCoords = JSON.parse(loadedCoords);
        getWeather(parsedCoords.latitude, parsedCoords.longitude);
    }
}

function wDescEngToKor(w_id) {
    var w_id_arr = [201,200,202,210,211,212,221,230,231,232,
    300,301,302,310,311,312,313,314,321,500,
    501,502,503,504,511,520,521,522,531,600,
    601,602,611,612,615,616,620,621,622,701,
    711,721,731,741,751,761,762,771,781,800,
    801,802,803,804,900,901,902,903,904,905,
    906,951,952,953,954,955,956,957,958,959,
    960,961,962];
    var w_kor_arr = ["가벼운 비를 동반한 천둥구름","비를 동반한 천둥구름","폭우를 동반한 천둥구름","약한 천둥구름",
    "천둥구름","강한 천둥구름","불규칙적 천둥구름","약한 연무를 동반한 천둥구름","연무를 동반한 천둥구름",
    "강한 안개비를 동반한 천둥구름","가벼운 안개비","안개비","강한 안개비","가벼운 적은비","적은비",
    "강한 적은비","소나기와 안개비","강한 소나기와 안개비","소나기","악한 비","중간 비","강한 비",
    "매우 강한 비","극심한 비","우박","약한 소나기 비","소나기 비","강한 소나기 비","불규칙적 소나기 비",
    "가벼운 눈","눈","강한 눈","진눈깨비","소나기 진눈깨비","약한 비와 눈","비와 눈","약한 소나기 눈",
    "소나기 눈","강한 소나기 눈","박무","연기","연무","모래 먼지","안개","모래","먼지","화산재","돌풍",
    "토네이도","구름 한 점 없는 맑은 하늘","약간의 구름이 낀 하늘","드문드문 구름이 낀 하늘","구름이 거의 없는 하늘",
    "구름으로 뒤덮인 흐린 하늘","토네이도","태풍","허리케인","한랭","고온","바람부는","우박","바람이 거의 없는",
    "약한 바람","부드러운 바람","중간 세기 바람","신선한 바람","센 바람","돌풍에 가까운 센 바람","돌풍",
    "심각한 돌풍","폭풍","강한 폭풍","허리케인"];
    for(var i=0; i<w_id_arr.length; i++) {
        if(w_id_arr[i]==w_id) {
            return w_kor_arr[i];
            break;
        }
    }
    return "none";
}

function loEngToKor(lo){
    var loEng = ["Asia/Seoul"];
    var loKor = ["서울"];

    for(var i=0; i < loEng.length; i++){
        if(loEng[i]==lo){
            return loKor[i];
            break;
        }
    }
    return "none";
}

//함수 실행 함수
function init(){
    loadCoords();
}

init();

//hover 이벤트를 위함 함수
