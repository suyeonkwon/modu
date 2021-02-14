<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--https://maps.googleapis.com/maps/api/js?key=AIzaSyDT7sSTMO5sgyqu_1l0KuaIK_QAyv0U44c&libraries=places&language=ko&callback=initMap --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../resource/css/style-login-join.css" />
<link rel="stylesheet" href="../resource/css/style-search.css" />
<script type="text/javascript">
function send(){
    var url = document.getElementById('url').value;
   // alert(url);
    
    var address = document.getElementById('address').value;
    //alert(address);
    
    var name = document.getElementById('name').value;
  //  alert(name);
        	        
    opener.document.getElementById('url').value = url;
    opener.document.getElementById('address').value = address;
    opener.document.getElementById('place').value = name;

  	self.close();       //나온다 ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ 어엉 ㅠㅠㅠㅠㅠㅠㅠㅠㅠ 감격 ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ
} 
</script>
</head>
<body>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDT7sSTMO5sgyqu_1l0KuaIK_QAyv0U44c&libraries=places"></script>
<input type="hidden" id="address">
<input type="hidden" id="url">
<input type="hidden" id="name">
<div class="search">
<label for="locationTextField">장소:</label>
<input id="locationTextField" size="50" type="text" /><input type="button" value="검색" id="searchbt" onclick="send()">
</div>
<script>
   function init() {
      var input = document.getElementById('locationTextField');
      var options = {
    		 componentRestrictions: {country: '${param.countryCode}'}
    		 };
      var autocomplete = new google.maps.places.Autocomplete(input,options);
      autocomplete.setFields(
              ['address_components','url','geometry', 'formatted_address','icon', 'name']);
      autocomplete.addListener('place_changed', function() {
          var place = autocomplete.getPlace();
          if (!place.geometry) {
            // User entered the name of a Place that was not suggested and
            // pressed the Enter key, or the Place Details request failed.
            window.alert("No details available for input: '" + place.name + "'");
            return;
          }
          
          document.getElementById("url").value=place.url
          document.getElementById("address").value=place.formatted_address;
          document.getElementById("name").value=place.name;
          
		  console.log(place);
      
          var address = '';
          if (place.address_components) {
            address = [
              (place.address_components[0] && place.address_components[0].short_name || ''),
              (place.address_components[1] && place.address_components[1].short_name || ''),
              (place.address_components[2] && place.address_components[2].short_name || '')
            ].join(' ');
            console.log(address);
          }

        });
   }
google.maps.event.addDomListener(window, 'load', init);
</script>
</body>
</html>