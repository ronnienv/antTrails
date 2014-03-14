<div id="title"><a href="/";> <img src="/assets/editform.jpg" alt="Edit Form"> </a> </div>
<div id="form" title="Edit Spot Form" style="width:300px";>
<p style="color:#CC0000">{{message}}</p>
<form method="post" id="edit">
	<p style="font-size:small;"> *required field </p>
	Spot Number:*<p style="font-size:small; color:#4775ff"><input type="text" name="spotNumber" maxlength="3" required> 
		ex. 24 
		</p>
	Password:<p style="font-size:small; color:#4775ff"><input type="password" name="password"> 
		</p>
	<input type="submit" name="submit" value="Edit"> 
	<input type="submit" name="delete" value="Delete Spot"> 
</form>
</div>

<style>

* { margin:0; padding:0; }
p { margin:5px 0 10px 0; }

body{
	height:600px;
}

#form{
    padding-left: 20px;
    padding-right: 20px;
    margin: 0;
}

input[type=submit] {padding:5px 15px; background:#428bca; color: #ffffff; border:0 none;
    cursor:pointer;
    -webkit-border-radius: 5px;
    border-radius: 5px; 
}

input.text { 
	margin-bottom:12px; width:92%; padding: 3px; 
}
    
fieldset { 
	padding:10px; border:0; margin-top:10px; 
}

button {
	padding:5px 15px; background:#428bca; color: #ffffff; border:0 none; cursor:pointer; -webkit-border-radius: 5px; border-radius: 5px; margin-left: 10px;
}
</style>

