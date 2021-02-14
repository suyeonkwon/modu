<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <title>Áöµµ</title>
    <style type="text/css">
          #map {
        height: 100%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
    </style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
    <div id="map"></div>
    <script>
    	//var html=${html} 
      function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 13,
          center: {lat: ${param.cityLat}, lng: ${param.cityLng}}
        });

        setMarkers(map);
      }

      var places=${places}; 

      function setMarkers(map) {
        var image = {
          url: '../resource/images/marker4.png',
          size: new google.maps.Size(30, 30)

        };
        var shape = {
          coords: [1, 1, 1, 20, 18, 20, 18, 1],
          type: 'poly'
        };
        var index=1;
        for (var i = 0; i < places.length; i++) {
          var labelIndex = ''+index++
          var place = places[i];
          var marker = new google.maps.Marker({
            position: place,
            map: map,
            icon: image,
            label: labelIndex            
          });
        }
        var placePath = new google.maps.Polyline({
        	path:places,
            geodesic: true,
            strokeColor: '#FF0000',
            strokeOpacity: 1.0,
            strokeWeight: 2
        })
        placePath.setMap(map);
        
      }
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDT7sSTMO5sgyqu_1l0KuaIK_QAyv0U44c&libraries=places&callback=initAutocomplete&callback=initMap">
    </script>
</body>
</html>
