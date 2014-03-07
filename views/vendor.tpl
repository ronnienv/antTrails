<div id="form">

<div id="title"><a href="/"> <img src= assets\spotocform.jpg> </a></div>
<p style="color:#CC0000">{{message}}</p>
		<p style="font-size:small;"> *required field </p>
	<div id="formcontent">
	<form method="post" id="reservations">

		Spot Number:*<p style="font-size:small; color:#4775ff"><input type="text" name="spotNumber" maxlength="3" required> 
		ex. 24 
		</p>
		
		Headline:*<p style="font-size:small; color:#4775ff"><input type="text" name="headline" maxlength="40" value = "{{hl}}" required> 
		ex. Free Cats!!!
		</p>
		
		Organization:*<p style="font-size:small; color:#4775ff"><input type="text" name="organization" maxlength="40"  value = "{{org}}" required>
		ex. Cat Lovers Anonymous
		</p>
		
		[Upload image...]
		<p></p>
		
		Description:<p style="font-size:small; color:#4775ff"><textarea rows="4" cols="50" name="description" form="reservations" maxlength="300">{{desc}}</textarea> 
		<!-- enter example -->
		</p>
		
		Password:<p style="font-size:small; color:#4775ff"><input type="text" name="password" value="{{pw}}" maxlength="15">
		<!-- enter example -->
		</p>

		<input type="submit"> 

	<form>
	</div>
</div>
<style>

#form{
    padding-left: 20px;
    padding-right: 20px;
    margin: 0;
}

input[type=submit] {padding:5px 15px; background:#3366FF; color: #ffffff; border:0 none;
    cursor:pointer;
    -webkit-border-radius: 5px;
    border-radius: 5px; }
</style>
	
