<script>
$(document).ready(function(){
	var str = document.getElementById("description");
	var size = str.length;
	if (size > 10)
	{
		$("p#description").hide();
		$("button#hide").hide();
		  $("#hide").click(function(){
		    $("p#description").hide();
		    $("button#hide").hide();
		    $("button#show").show();
		  });
		  $("#show").click(function(){
		    $("p#description").show();
		    $("button#show").hide();
		    $("button#hide").show();
		  });
	}
	else
	{
		$("p#description").hide();
		$("button#hide").hide();
		$("button#show").hide();
	}
});
</script>

<div id="leftCol">
	<div id="title"><a href="/"> <img src= assets\spotoc.jpg> </a></div>
    <table class="table table-striped">
      <thead>
        <tr>
          <th>Headline</th>
          <th>Organization</th>
          <th>Spot Number</th>
          <th style="width: 180px";>Description</th>
        </tr>
      </thead>
      <tbody>
       %for v in vendors:
       <tr>
		 <td>{{v['headline']}}</td>
         <td>{{v['organization']}}</td>
         <td>{{v['spot_id']}}</td>
         <td>{{v['description']}} 
			<p id="description">faffeafasadasdadasdadsda</p>
			<button id="hide">Hide</button>
			<button id="show">Read More</button>
         </td>
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
	  
	  var mapCenter=new google.maps.LatLng(33.645854,-117.842681);
	 
	  function initialize()
	  {
		var mapControls = {
		  center:mapCenter,
		  zoom:17,
		  mapTypeId:google.maps.MapTypeId.ROADMAP,
		  streetViewControl : false,
		  minZoom : 16,
		  panControl : false,
		  tilt: 0
		};
		var map=new google.maps.Map(document.getElementById("googleMap"), mapControls);

		var marker
		var temp_latlng
		var infowindow

		%for s in spots:
			temp_latlng = new google.maps.LatLng({{s['latitude']}},{{s['longitude']}})

			marker = new google.maps.Marker({position: temp_latlng,
													map: map});

			infowindow = new google.maps.InfoWindow({content:{{s['latitude']}}
	 		 });
			
		%end

		google.maps.event.addListener(marker, 'click', function() {
				infowindow.open(map,marker);
	 		});


		google.maps.event.addListener(map, 'zoom_changed', function() {

			if(map.getZoom() > 18)
				map.setMapTypeId(google.maps.MapTypeId.SATELLITE)
			if(map.getZoom() <= 18)
				map.setMapTypeId(google.maps.MapTypeId.ROADMAP)

	  	});


		google.maps.event.addListener(map, 'dragend', function() {

			var bounds = new google.maps.LatLngBounds(new google.maps.LatLng(33.6423851,-117.8468299), new google.maps.LatLng(33.6506491,-117.8365209));
			if(!bounds.contains(map.getCenter()))	
			{
				window.setTimeout(function() {
	      		map.panTo(mapCenter);
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

#description{
	width: ;
}

button {padding:2px 12px; background:#3366FF; color: #ffffff; border:0 none;
    cursor:pointer;
    -webkit-border-radius: 5px;
    border-radius: 5px; 
    font-size: small;
    width: 87px;

</style>

