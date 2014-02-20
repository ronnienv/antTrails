    
      <div class="row">
        <div class="col-md-4"><div class="table-responsive">
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
        <div class="col-md-8"><!DOCTYPE html>
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
  mapTypeId:google.maps.MapTypeId.HYBRID
  };
var map=new google.maps.Map(document.getElementById("googleMap")
  ,mapProp);
}

google.maps.event.addDomListener(window, 'load', initialize);
</script>
</head>

<body>
<div id="googleMap" style="width:100%;height:600px;"></div>

</body>
</html></div>
      </div>

