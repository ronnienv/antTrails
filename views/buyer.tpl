
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

