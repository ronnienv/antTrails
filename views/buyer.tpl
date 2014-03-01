
<div id="leftCol">
    <table class="table table-striped">
      <thead>
        <tr>
          <th>Headline</th>
          <th>Description</th>
          <th>Products</th>
          <th>Organization</th>
          <th>Spot Number</th>
        </tr>
      </thead>
      <tbody>
       %for v in vendors:
       <tr>
         <td>{{v['headline']}}</td>
         <td>{{v['description']}}</td>
         <td>{{v['products']}}</td>
         <td>{{v['Organization']}}</td>
         <td>{{v['spotID']}}</td>
       </tr>
       %end
	  </tbody>
	</table>
</div>

<!-- /.table-responsive -->

<div id="rightCol">
	<head>
	  <script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDY0kkJiTPVd2U7aTOAwhc9ySH6oHxOIYM&sensor=false">
	  </script>

	  <script>
	  
	  var myCenter=new google.maps.LatLng(33.645854,-117.842681);
	  
	  function initialize()
	  {
		var mapProp = {
		  center:myCenter,
		  zoom:17,
		  mapTypeId:google.maps.MapTypeId.ROADMAP
		};
		var map=new google.maps.Map(document.getElementById("googleMap"), mapProp);
		
		var marker=new google.maps.Marker({position:myCenter});
		marker.setMap(map);


		var infowindow = new google.maps.InfoWindow({
  			content:"TECH BECKA!"
		});

		google.maps.event.addListener(marker, 'click', function() {
  		 infowindow.open(map,marker);
  		});

		
		google.maps.event.addListener(map, 'center_changed', function() {

			var bounds = new google.maps.LatLngBounds(new google.maps.LatLng(33.6423851,-117.8468299), new google.maps.LatLng(33.6506491,-117.8365209));

		
			if(!bounds.contains(map.getCenter()))	
			{
				window.setTimeout(function() {
	      		map.panTo(myCenter);
	   		 	});
			}
			else
			{
				window.setTimeout(function() {
	      		map.panTo(myCenter);
	   		 	});
			}
		
		  	
	  	});
	  }

	  google.maps.event.addDomListener(window, 'load', initialize);	
	

		
	  

	  </script>


	</head>
	<div id="googleMap" style="width:100%;height:600px;"></div>
</div>
		
<style>

* { margin:0; padding:0; }
p { margin:5px 0 10px 0; }

#leftCol{
	float: left;
	width: 40%;
	overflow-y: scroll;
	padding-left: 20px;
	padding-right: 10px
	padding-bottom: 10px;
	}
#rightCol{
	width: 60%;
	float:left;
	padding-left: 10px;
	padding-right: 15px;
	padding-bottom: 10px;}
</style>

