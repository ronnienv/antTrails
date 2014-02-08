<div class="table-responsive">
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
</div><!-- /.table-responsive -->