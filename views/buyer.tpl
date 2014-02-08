<div class="table-responsive">
<table class="table">
  <thead>
    <tr>
      <th>Headline</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
	%for v in vendors:
    <tr>
	  <td>{{v['headline']}}</td>
	  <td>{{v['description']}}</td>	  
    </tr>
    %end
  </tbody>
</table>
</div><!-- /.table-responsive -->