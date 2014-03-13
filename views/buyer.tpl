<script>
$(document).ready(function(){

	%for v in vendors:
	var str = "{{v['description']}}"
	var size = str.length;

	if (size > 0)
	{
		$("p[id=\"description\"][value={{v['spot_id']}}]").hide();
		$("button[id=\"hide\"][value={{v['spot_id']}}]").hide();

		$("button[id=\"hide\"][value={{v['spot_id']}}]").click(function(){
			$("p[id=\"description\"][value={{v['spot_id']}}]").hide();
			$("button[id=\"hide\"][value={{v['spot_id']}}]").hide();
			$("button[id=\"show\"][value={{v['spot_id']}}]").show();
		});

		$("button[id=\"show\"][value={{v['spot_id']}}]").click(function(){
			$("p[id=\"description\"][value={{v['spot_id']}}]").show();
			$("button[id=\"show\"][value={{v['spot_id']}}]").hide();
			$("button[id=\"hide\"][value={{v['spot_id']}}]").show();
		});
	}
	else
	{
		$("p[id=\"description\"][value={{v['spot_id']}}]").hide();
		$("button[id=\"hide\"][value={{v['spot_id']}}]").hide();
		$("button[id=\"show\"][value={{v['spot_id']}}]").hide();
	}
	%end

});

	// var width = $(window).width();
	// if(width > )
</script>

<div>
	<div id="title"><a href="/"> <img src="/assets/spotoc.jpg"	 alt="Spot Occupants"> </a></div>
	<div id="leftCol">
    <table class="table table-striped">
      <thead>
        <tr>
          <th style="width: 110px">Spot Number</th>
          <th>Headline</th>
          <th>Organization</th>
          <th style="width: 180px">Description</th>
        </tr>
      </thead>
      <tbody>
       %for v in vendors:
       %print v
       <tr id = "id_{{v['pos']}}" onclick = 'alert("Row index is: {{v['pos']}}");'>
       	 <td style="width: 110px"><center>{{v['spot_id']}}</center></td>
		 <td>{{v['headline']}}</td>
         <td>{{v['organization']}}</td>
         <td style="padding-right: 0px; padding-left: 0px">
         	<p id="description" value="{{v['spot_id']}}">{{v['description']}}</p>
			<button id="hide" value="{{v['spot_id']}}">Hide</button>
			<button id="show" value="{{v['spot_id']}}">View</button>
         </td>
       </tr>
       %end
	  </tbody>
	</table>
	</div>
</div>

<!-- /.table-responsive -->

<div id="rightCol">
	<head>
	  <script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDY0kkJiTPVd2U7aTOAwhc9ySH6oHxOIYM&sensor=false">
	  </script>

	  <script>
	  
	  var mapCenter=new google.maps.LatLng(33.6465707,-117.8420422);
	 
	  function initialize()
	  {
		var mapControls = {
		  center:mapCenter,
		  zoom:17,
		  mapTypeControl: false,
		  mapTypeId:google.maps.MapTypeId.ROADMAP,
		  streetViewControl : false,
		  minZoom : 16,
		  panControl : false,
		  tilt: 0
		};
		var map = new google.maps.Map(document.getElementById("googleMap"), mapControls);

		google.maps.event.addListener(map, 'dragend', function() {
			
			var bounds = new google.maps.LatLngBounds(new google.maps.LatLng(33.6423851,-117.8468299), new google.maps.LatLng(33.6506491,-117.8365209));
			if(!bounds.contains(map.getCenter()))	
			{
				window.setTimeout(function() {
	      		map.panTo(mapCenter);
	   		 	});
			}

	  	});

	  	
		google.maps.event.addListener(map, 'zoom_changed', function() {

			if(map.getZoom() > 18)
				map.setMapTypeId(google.maps.MapTypeId.HYBRID);
			if(map.getZoom() <= 18)
				map.setMapTypeId(google.maps.MapTypeId.ROADMAP);

	  	});
		var markers = [];

		%for s in spots:
			var temp_latlng = new google.maps.LatLng({{s[0]['latitude']}}, {{s[0]['longitude']}});

			var marker = new google.maps.Marker({position: temp_latlng,
													map: map});

			var infowindow = new google.maps.InfoWindow({content: '{{s[0]['latitude']}}'});

			google.maps.event.addListener(marker, 'click', function() {
				infowindow.open(map, this);
				var content = '<p>'+'{{s[0]['headline']}}'+'<br />' + ' {{s[0]['organization']}}'+'<br />' + ' {{s[0]['description']}}'+'</p>';
				infowindow.setContent(content);
	 		});

	 		markers.push(marker);
		%end

		var markerCluster = new MarkerClusterer(map, markers);

		markerObj =  document.getElementById(markerId);
		

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
	overflow-y: scroll;
	height: 500px;
	}
#rightCol{
	width: 60%;
	float:left;
	padding-left: 10px;
	padding-right: 15px;
	padding-bottom: 10px;
	height: 500px;
	}

#description{
	width: 180px;
}

button {padding:2px 12px; background:#428bca; color: #ffffff; border:0 none;
    cursor:pointer;
    -webkit-border-radius: 5px;
    border-radius: 5px; 
    font-size: small;
    width: 87px;

#googleMap {
	height: 500px;
}
</style>

