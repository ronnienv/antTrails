
	 
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
	   </div><!-- /.table-responsive --></div> 

<div id="rightCol">
	    <html>
	    <head>
	      <script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDY0kkJiTPVd2U7aTOAwhc9ySH6oHxOIYM&sensor=false">
	      </script>
 	
	      <script>
	      function initialize()
	      {
	        var mapProp = {
	          center:new google.maps.LatLng(33.645854,-117.842681),
	          zoom:16,
	          mapTypeId:google.maps.MapTypeId.ROADMAP
	        };
	        var map=new google.maps.Map(document.getElementById("googleMap")
	          ,mapProp);
	      }
	
	      google.maps.event.addDomListener(window, 'load', initialize);
	      </script>
	    </head>
	      <div id="googleMap" style="width:100%;height:600px;"></div>
	  </table>





<head>
<style>
html, body, * {
    padding: 0;
    margin: 0;
}
html {
    width: 100%;
    height: 100%;
    position: absolute;
}
#leftCol {
    background: ;
    position: absolute;
    left: 0;
    top: 0;
    bottom: 0;
    right: 75%;
    overflow: hidden;
    padding: 2em;
}
#rightCol {
    background: ;
    position: absolute;
    left: 25%;
    top: 0;
    bottom: 0;
    right: 0;
    overflow-y: auto;    
    padding: 2em;
}
</style>
</head>